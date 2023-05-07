<?php 
defined('BASEPATH') OR exit('No direct script access allowed');
require_once('vendor/autoload.php');
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
class Umkm extends CI_Controller {

	var $table = 'umkm';
	var $id = 'id';
	var $tableJoin = 'rw';
	var $viewName = 'view_umkm';
	var $column_order = ['nama_umkm','pemilik','rw','pemilik','status','rw'];
	var $column_search = ['nama_umkm','pemilik','rw'];
	var $select = ['id','nama_umkm','pemilik','status','rw'];
   public function __construct()
	{
		parent::__construct();
		$this->load->model('my_model', 'my');
		$this->load->model('umkm_model', 'umkm', true);
		$this->load->model('menu_model', 'menu', true);
   }
   
	public function ajax_list()
   {
      $list = $this->my->get_datatables();
      $data = [];
      $no = 1;

      foreach($list as $li){
         $row = [];
         $row[] = '<input type="checkbox" class="data-check" value="' . $li->id . '">';
			$row[] = $li->nama_umkm;
			
			$row[] = $li->pemilik;
			$row[] = $li->rw;
			$row[] = $li->status;
         $row[] = 
         '<div class="btn-group"><a class="btn btn-sm btn-warning text-white mr-1" href="'.base_url("back/umkm/update/$li->id").'" 
         title="Edit">
			<i class="fa fa-pencil-alt mr-1"></i></a>

			<a class="btn btn-sm btn-danger" href="#" 
			title="Delete" onclick="delete_umkm('."'".$li->id."'".')">
			<i class="fa fa-trash mr-1"></i></a></div>';
         $data[] = $row;
      }

      $output = [
         'draw'            => $_POST['draw'],
         'recordsTotal'    => $this->my->count_all(),
         'recordsFiltered' => $this->my->count_filtered(),
         'data'            => $data
      ];

      echo json_encode($output);
	}

	public function get_data()
   {
      $data = $this->my->get_by_id($this->input->post('id', true));
      echo json_encode($data);
	}

	public function action()
	{
		$this->form_validation->set_rules('rw','rw','trim|required');

		if($this->form_validation->run() != false){
			$data = [
				'rw'=> $this->input->post('rw', true),
			];

			$id = $this->input->post('id', true);

			// For Update
			if(!empty($id)){
				$this->my->update(['id' => $id], $data);
				$status = true;
			}
			// For Insert
			else{
				$this->my->save($data);
				$status = true;
			}

			echo json_encode(["status" => $status]);
		}
	}

	public function delete(){
		$this->umkm->deteleImageUMKM($this->input->post('id', true));
		$this->my->delete($this->input->post('id', true));
		
		echo json_encode(["status" => TRUE]);
	}
	public function bulk_delete()
	{
		$list_id = $this->input->post('id', true);
		
		foreach ($list_id as $id){
			$this->umkm->deteleImageUMKM($id);
			$this->my->delete($id);
		}

		echo json_encode(["status" => TRUE]);
	}

	public function create()
	{
		if(!$_POST){
			$input = (object) $this->umkm->getDefaultValues();
		}else{
			$input = (object) $this->input->post(null, true);
			$input->cover = "";	
		}
		$this->form_validation->set_rules('nama_umkm','Nama UMKM','required');
		$this->form_validation->set_rules('pemilik','Pemilik','required');
		$this->form_validation->set_rules('id_rt','RT','required');
		$this->form_validation->set_rules('deskripsi','Deskripsi','required');
		if($this->form_validation->run() == false){
			$data['title'] = 'Tambah UMKM';
			$data['form_action'] = base_url("back/umkm/create");
			$data['rt'] = $this->umkm->getRT();
			$data['input'] = $input;
			$data['menu'] = $this->menu->getMenu();
			$this->load->view('back/pages/article/form_umkm', $data);
		}else{
			$data = [
				'nama_umkm' => $input->nama_umkm,
				'pemilik' => $input->pemilik,
				'id_rt' => $input->id_rt,
				'nib'=>$input->nib,
				'deskripsi' => $input->deskripsi,
				'facebook' => $input->facebook,
				'shopee' => $input->shopee,
				'whatsapp' => $input->whatsapp,
				'gojek' => $input->gojek,
				'grab' => $input->grab,
				'lokasi' => $input->lokasi,
				'link_gmaps' => $input->link_gmaps,
				'status' => $input->status
			];
			if(!empty($_FILES['cover']['name'])){
				$upload = $this->umkm->uploadImage();
				$this->_create_thumbs($upload);	
				$data['cover'] = $upload;
			}
			
			$this->my->save($data);
			$id = $this->db->insert_id();
			
			$attachments = $this->input->post('attachments');
			if(isset($attachments) && count($attachments) > 0){
				foreach($attachments as $key => $val){
					// update idumkm
					$this->db->update('album_umkm', ['id_umkm' => $id],[ 'gambar' => $val]);
	
				}
			}
			$this->session->set_flashdata('success', 'UMKM Berhasil Ditambahkan.');
			
			redirect(base_url('admin/umkm'));
		}

	}

	public function update($id)
	{
		$dataPost = $this->umkm->getUMKMByid($id);

		if(!$dataPost){
			$this->session->set_flashdata('warning','Maaf, data tidak dapat ditemukan!');
			redirect(base_url('admin/umkm'));
		}

		if(!$_POST){
			$input = $dataPost;
		}else{
			$input = (object) $this->input->post(null, true);
			$input->cover = $dataPost->cover;
			$input->album = $dataPost->album;
		}
		$this->form_validation->set_rules('nama_umkm','Nama UMKM','required');
		$this->form_validation->set_rules('pemilik','Pemilik','required');
		$this->form_validation->set_rules('id_rt','RT','required');
		$this->form_validation->set_rules('deskripsi','Deskripsi','required');

		if($this->form_validation->run() == false){
			$data['title'] = 'Edit UMKM';
			$data['form_action'] = base_url("back/umkm/update/$id");
			$data['rt'] = $this->umkm->getRT();
			$data['input'] = $input;
			$data['menu'] = $this->menu->getMenu();
			$this->load->view('back/pages/article/form_umkm', $data);
		}else{
			
			$data = [
				'nama_umkm' => $input->nama_umkm,
				'pemilik' => $input->pemilik,
				'id_rt' => $input->id_rt,
				'nib'=>$input->nib,
				'deskripsi' => $input->deskripsi,
				'facebook' => $input->facebook,
				'shopee' => $input->shopee,
				'whatsapp' => $input->whatsapp,
				'gojek' => $input->gojek,
				'grab' => $input->grab,
				'lokasi' => $input->lokasi,
				'link_gmaps' => $input->link_gmaps,
				'status' => $input->status
			];


			if(!empty($_FILES['cover']['name'])){
				$upload = $this->umkm->uploadImage();
				$this->_create_thumbs($upload);
				$posting = $this->my->get_by_id($id);

				if(file_exists('images/umkm/' . $posting->photo) && $posting->photo){
					unlink('images/umkm/' . $posting->photo);
				}

				$data['cover'] = $upload;
			}
			$attachments = $this->input->post('attachments');
			if(isset($attachments) && count($attachments) > 0){
				foreach($attachments as $key => $val){
					// update idumkm
					$this->db->update('album_umkm', ['id_umkm' => $id],[ 'gambar' => $val]);
	
				}
			}
			$this->my->update(['id' => $id], $data);
			$this->session->set_flashdata('success', 'UMKM Berhasil Diupdate.');

			redirect(base_url('admin/umkm'));
		}

	}

	public function upload_album()
	{
		$config = [
			'upload_path'     => './images/umkm',
			'encrypt_name'    => TRUE,
			'allowed_types'   => 'jpg|jpeg|gif|png|JPG|PNG',
			'max_size'        => 1000,
			'max_width'       => 0,
			'max_height'      => 0,
			'overwrite'       => TRUE,
			'file_ext_tolower'=> TRUE
		  ];
	  
	
	  
		 $jumlahFile = count($_FILES['file']['name']);
		 
		 $file_album = $_FILES;
		 $file_names = [];
		 for($i = 0; $i < $jumlahFile; $i++){
			// upload file
			$_FILES['file']['name'] = $file_album['file']['name'][$i];
			$_FILES['file']['type'] = $file_album['file']['type'][$i];
			$_FILES['file']['tmp_name'] = $file_album['file']['tmp_name'][$i];
			$_FILES['file']['error'] = $file_album['file']['error'][$i];
			$_FILES['file']['size'] = $file_album['file']['size'][$i];
			// if($this->upload->do_upload('file')){
			$this->load->library('upload', $config);
			if($this->upload->do_upload('file')){
					// insert into table
				$file_name =  $this->upload->data('file_name');
				
				$data = [
					'gambar' => $file_name
				];
				$this->db->insert('album_umkm', $data);
				// get id
				$id = $this->db->insert_id();
				$file_names[] = [
					'id' => $id,
					'file_name' => $file_name
				];
				$this->_create_thumbs($file_name);
			}
			
		 }
		
		echo json_encode($file_names);
	}

	public function remove_file_album(){
		$filename = $this->input->post('filename');
		// remove from database
		$this->db->where('gambar', $filename);
		$this->db->delete('album_umkm');
		$this->umkm->deleteImage($filename);
		echo $filename;
	}

	public function _create_thumbs($file_name)
	{
		$config = [
			// Large Image
			[
				'image_library'	=> 'GD2',
				'source_image'		=> './images/umkm/' . $file_name,
				'maintain_ratio'	=> TRUE,
				'width'				=> 770,
				'height'				=> 450,
				'new_image'			=> './images/umkm/large/' . $file_name
			],
			// Medium Image
			[
				'image_library'	=> 'GD2',
				'source_image'		=> './images/umkm/' . $file_name,
				'maintain_ratio'	=> FALSE,
				'width'				=> 300,
				'height'				=> 188,
				'new_image'			=> './images/umkm/medium/' . $file_name
			],
			// Small Image
			[
				'image_library'	=> 'GD2',
				'source_image'		=> './images/umkm/' . $file_name,
				'maintain_ratio'	=> FALSE,
				'width'				=> 270,
				'height'				=> 169,
				'new_image'			=> './images/umkm/small/' . $file_name
			],
			// XSmall Image
			[
				'image_library'	=> 'GD2',
				'source_image'		=> './images/umkm/' . $file_name,
				'maintain_ratio'	=> FALSE,
				'width'				=> 170,
				'height'				=> 100,
				'new_image'			=> './images/umkm/xsmall/' . $file_name
			],
		];

		$this->load->library('image_lib', $config[0]);

		foreach ($config as $item){
			$this->image_lib->initialize($item);

			if(!$this->image_lib->resize()){
				return false;
			}

			$this->image_lib->clear();
		}
	}


	public function export(){
		$file_name = 'Data UMKM - ' . date('d-m-Y') . '.xlsx';
		$umkm = $this->my->get_all();
		$spreadsheet = new Spreadsheet();
    	$sheet = $spreadsheet->getActiveSheet();
		$style_col = [
			'font' => ['bold' => true], // Set font nya jadi bold
			'alignment' => [
			  'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER, // Set text jadi ditengah secara horizontal (center)
			  'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
			],
			'borders' => [
			  'top' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border top dengan garis tipis
			  'right' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN],  // Set border right dengan garis tipis
			  'bottom' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border bottom dengan garis tipis
			  'left' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN] // Set border left dengan garis tipis
			]
		];
		  // Buat sebuah variabel untuk menampung pengaturan style dari isi tabel
		  $style_row = [
			'alignment' => [
			  'vertical' => \PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER // Set text jadi di tengah secara vertical (middle)
			],
			'borders' => [
			  'top' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border top dengan garis tipis
			  'right' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN],  // Set border right dengan garis tipis
			  'bottom' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN], // Set border bottom dengan garis tipis
			  'left' => ['borderStyle'  => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN] // Set border left dengan garis tipis
			]
		  ];
		  $sheet->setCellValue('A1', "DATA UMKM"); // Set kolom A1 dengan tulisan "DATA SISWA"
		  $sheet->mergeCells('A1:L1'); // Set Merge Cell pada kolom A1 sampai E1
		  $sheet->getStyle('A1')->getFont()->setBold(true); // Set bold kolom A1
		  $sheet->getStyle('A1')->getFont()->setSize(15); // Set font size 15 untuk kolom A1
		// a1 center 
		$sheet->getStyle('A1')->getAlignment()->setHorizontal(\PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER);
		// a1 center
		$sheet->getStyle('A1')->getAlignment()->setVertical(\PhpOffice\PhpSpreadsheet\Style\Alignment::VERTICAL_CENTER);
		
		$sheet->setCellValue('A2', "No.");
		$sheet->setCellValue('B2', "UMKM");
		$sheet->setCellValue('C2', "Pemilik");
		$sheet->setCellValue('D2', "NIB");
		$sheet->setCellValue('E2', "RW");
		$sheet->setCellValue('F2', "RT");
		$sheet->setCellValue('G2', "Lokasi");
		$sheet->setCellValue('H2', "Whatsapp");
		$sheet->setCellValue('I2', "Grab");

		$sheet->getStyle('A2')->applyFromArray($style_col);
		$sheet->getStyle('B2')->applyFromArray($style_col);
		$sheet->getStyle('C2')->applyFromArray($style_col);
		$sheet->getStyle('D2')->applyFromArray($style_col);
		$sheet->getStyle('E2')->applyFromArray($style_col);
		$sheet->getStyle('F2')->applyFromArray($style_col);
		$sheet->getStyle('G2')->applyFromArray($style_col);
		$sheet->getStyle('H2')->applyFromArray($style_col);
		$sheet->getStyle('I2')->applyFromArray($style_col);
		$no = 1; // Untuk penomoran tabel, di awal set dengan 1
		$numrow = 3; // Set baris pertama untuk isi tabel adalah baris ke 4
		foreach($umkm as $data){ // Lakukan looping pada variabel siswa
		$sheet->setCellValue('A'.$numrow, $no);
		$sheet->setCellValue('B'.$numrow, $data->nama_umkm);
		$sheet->setCellValue('C'.$numrow, $data->pemilik);
		$sheet->setCellValue('D'.$numrow, $data->nib);
		$sheet->setCellValue('E'.$numrow, $data->rw);
		$sheet->setCellValue('F'.$numrow, $data->rt);
		$sheet->setCellValue('G'.$numrow, $data->lokasi);
		$sheet->setCellValue('H'.$numrow, $data->whatsapp);
		$sheet->setCellValue('I'.$numrow, $data->grab);

		
		// Apply style row yang telah kita buat tadi ke masing-masing baris (isi tabel)
		$sheet->getStyle('A'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('B'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('C'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('D'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('E'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('F'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('G'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('H'.$numrow)->applyFromArray($style_row);
		$sheet->getStyle('I'.$numrow)->applyFromArray($style_row);
		
		$no++; // Tambah 1 setiap kali looping
		$numrow++; // Tambah 1 setiap kali looping
		}

		// set autosize
		foreach(range('A','I') as $columnID) {
			$sheet->getColumnDimension($columnID)
				->setAutoSize(true);
		}
 		$sheet->setTitle("Laporan Data UMKM");
		$writer = new Xlsx($spreadsheet);
		$filename = 'Laporan Data UMKM';
		header('Content-Type: application/vnd.ms-excel');
		header('Content-Disposition: attachment;filename="'. $filename .'.xlsx"');
		header('Cache-Control: max-age=0');
		$writer->save('php://output');

	}
}

/* End of file Category.php */
