<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Umkm_model extends CI_Model {

   public $perPage = 5;

   public function getRW()
   {
      
		// select id,rw, count umkm
		$this->db->select('rw.id, rw.rw');
      return $this->db->get("rw")->result();
   }

	public function getRT(){
		$this->db->select('rt.id, rt.rt');
		return $this->db->get("rt")->result();
	}

	public function getViewRT(){
		$this->db->select("id, concat('RT ',rt,' RW ',rw) as rt");
		return $this->db->get("view_rt")->result();
	}

   public function getDefaultValues()
   {
      return [
         'nama_umkm'        => '',
         'id_rt'    => '',
         'pemilik'      => '',
         'nib'     => '',
         'deskripsi'       => '',
         'lokasi'       => '',
         'whatsapp'  => '',
         'shopee'        => '',
         'tokopedia'    => '',
         'facebook'         => '',
			'status'         => '',
			'gojek'=>'',
			'grab'=>'',
			'link_gmaps'=>'',
			'cover'=>'',
			'album'=>[]
      ];
   }



	public function getUMKMByid($id){
		$data = $this->db->get_where('view_umkm', ['id' => $id])->row();
		$data->album = $this->db->get_where('album_umkm', ['id_umkm' => $id])->result();
		foreach($data->album as $key => $value){
			//url
			$data->album[$key]->url = base_url("images/umkm/$value->gambar");
		}
		return $data;
	}

   public function uploadImage(){

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
  
      $this->load->library('upload', $config);
  
      if(!$this->upload->do_upload('cover')){
        $data['error_string'] = 'Upload error: '.$this->upload->display_errors('',''); 
        exit();
      }
      return $this->upload->data('file_name');
   }
  
   public function deleteImage($fileName){
      if(file_exists("./images/umkm/$fileName")){
        unlink("./images/umkm/$fileName");
      }
   }

	public function deteleImageUMKM($id){
		// get cover from table umkm
		$cover = $this->db->get_where('umkm', ['id' => $id])->row()->cover;
		// get gambar from table album_umkm
		$album = $this->db->get_where('album_umkm', ['id_umkm' => $id])->result();
		// delete cover
		$this->deleteImage($cover);
		// delete album
		foreach($album as $key => $value){
			$this->deleteImage($value->gambar);
		}
	}

	// get 4 umkm join RW last
	public function getLastUMKM(){
		
		$this->db->order_by('created_at', 'DESC');
		$this->db->limit(4);
		return $this->db->get('view_umkm')->result();
	}

	// get all umkm join rw based page order by created at desc
	public function getAllUMKM($page = null){
		$this->db->order_by('created_at', 'DESC');
		if($page){
			$this->paginate($page);
		}else{
			$this->paginate(1);
		}
		return $this->db->get('view_umkm')->result();
	}

	// get all umkm join rw based page order by created at desc
	public function getAllUMKMByRW($idrw, $page = null){
		// $this->db->from('umkm');
		// $this->db->select('umkm.id,umkm.id_rw, umkm.nama_umkm, umkm.pemilik, umkm.nib, umkm.deskripsi, umkm.lokasi, umkm.whatsapp, umkm.shopee, umkm.tokopedia, umkm.facebook, umkm.status, umkm.gojek, umkm.grab, umkm.link_gmaps, umkm.cover, created_at, rw.rw');
		// $this->db->join('rw', 'rw.id = umkm.id_rw', 'left');
		$this->db->where('id_rw', $idrw);
		$this->db->order_by('created_at', 'DESC');
		if($page){
			$this->paginate($page);
		}else{
			$this->paginate(1);
		}
		return $this->db->get('view_umkm')->result();
	}

	// countUMKM
	public function countUMKM($idrw = null){
		if($idrw){
			$this->db->where('id_rw', $idrw);
		}
		return $this->db->get('view_umkm')->num_rows();
	}
// countUMKM

public function countUMKMSearch($keyword){
	$this->db->like('nama_umkm', $keyword);
	$this->db->or_like('pemilik', $keyword);
	// $this->db->or_like('deskripsi', $keyword);
	return $this->db->get('view_umkm')->num_rows();
}

public function searchUMKM($keyword, $page = null){
	// $this->db->from('umkm');
	// $this->db->select('umkm.id,umkm.id_rw, umkm.nama_umkm, umkm.pemilik, umkm.nib, umkm.deskripsi, umkm.lokasi, umkm.whatsapp, umkm.shopee, umkm.tokopedia, umkm.facebook, umkm.status, umkm.gojek, umkm.grab, umkm.link_gmaps, umkm.cover, created_at, rw.rw');
	// $this->db->join('rw', 'rw.id = umkm.id_rw', 'left');
	$this->db->like('nama_umkm', $keyword);
	$this->db->or_like('pemilik', $keyword);
	// $this->db->or_like('deskripsi', $keyword);
	$this->db->order_by('created_at', 'DESC');
	if($page){
		$this->paginate($page);
	}else{
		$this->paginate(1);
	}
	return $this->db->get('view_umkm')->result();
}



   public function paginate($page){
      return  $this->db->limit($this->perPage, $this->calculateRealOffset($page));
   }
  
   public function calculateRealOffset($page){
      if(is_null($page) || empty($page)){
         $offset = 0;
      }else{
         $offset = ($page * $this->perPage) - $this->perPage;
      }
      
      return $offset;
   }
  
   public function makePagination($baseUrl, $uriSegment, $totalRows = null){
      $this->load->library('pagination');

      $config = [
         'base_url'            => $baseUrl,
         'uri_segment'         => $uriSegment,
         'per_page'            => $this->perPage,
         'total_rows'          => $totalRows,
         'use_page_numbers'    => true,
         
         'full_tag_open'       => '<ul class="pagination justify-content-center">',
         'full_tag_close'      => '</ul>',
         
         'attributes'          => ['class' => 'page-link text-danger'],
         'first_link'          => false,
         'last_link'           => false,
         'first_tag_open'      => '<li class="page-item">',
         'first_tag_close'     => '</li>',
         'prev_link'           => '&lt',
         'prev_tag_open'       => '<li class="page-item">',
         'prev_tag_close'      => '</li>',
         'next-link'           => '&gt',
         'next_tag_open'       => '<li class="page-item">',
         'next_tag_close'      => '</li>',
         'last_tag_open'       => '<li class="page-item">',
         'last_tag_close'      => '</li>', 
         'cur_tag_open'        => '<li class="page-item danger"><a href="#" class="page-link text-white">',
         'cur_tag_close'       => '<span class="sr-only">(current)</span></a></li>',
         'num_tag_open'        => '<li class="page-item">',
         'num_tag_close'       => '</li>',
			'reuse_query_string' => true
      ];

      $this->pagination->initialize($config);
      return $this->pagination->create_links();
   }
	public function makePaginationSearch($baseUrl, $uriSegment, $totalRows = null){
      $this->load->library('pagination');
		// $baseUrl = $baseUrl.$params;
      $config = [
         'base_url'            => $baseUrl,
         'uri_segment'         => $uriSegment,
         'per_page'            => $this->perPage,
         'total_rows'          => $totalRows,
         'use_page_numbers'    => true,
         'full_tag_open'       => '<ul class="pagination justify-content-center">',
         'full_tag_close'      => '</ul>',
         
         'attributes'          => ['class' => 'page-link text-danger'],
         'first_link'          => false,
         'last_link'           => false,
         'first_tag_open'      => '<li class="page-item">',
         'first_tag_close'     => '</li>',
         'prev_link'           => '&lt',
         'prev_tag_open'       => '<li class="page-item">',
         'prev_tag_close'      => '</li>',
         'next-link'           => '&gt',
         'next_tag_open'       => '<li class="page-item">',
         'next_tag_close'      => '</li>',
         'last_tag_open'       => '<li class="page-item">',
         'last_tag_close'      => '</li>', 
         'cur_tag_open'        => '<li class="page-item danger"><a href="#" class="page-link text-white">',
         'cur_tag_close'       => '<span class="sr-only">(current)</span></a></li>',
         'num_tag_open'        => '<li class="page-item">',
         'num_tag_close'       => '</li>',
			'reuse_query_string' => true
      ];

      $this->pagination->initialize($config);
      return $this->pagination->create_links();
   }

}

/* End of file Category_model.php */
