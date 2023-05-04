<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Rw extends CI_Controller {

	var $table = 'rw';
	var $id = 'id';
	var $tableJoin = '';
	var $viewName = 'view_rw';
	var $column_order = ['rw'];
	var $column_search = ['rw'];

   public function __construct()
	{
		parent::__construct();
		$this->load->model('my_model', 'my');
   }
   
	public function ajax_list()
   {
      $list = $this->my->get_datatables();
      $data = [];
      $no = 1;

      foreach($list as $li){
         $row = [];
         $row[] = $no++;
			$row[] = $li->rw;
			
			$row[] = $li->jumlah_umkm;
         $row[] = 
         '<div class="btn-group"><a class="btn btn-sm btn-warning text-white mr-1" href="#" 
         title="Edit" onclick="edit_rw('."'" . $li->id . "'".')">
			<i class="fa fa-pencil-alt mr-1"></i></a>

			<a class="btn btn-sm btn-danger" href="#" 
			title="Delete" onclick="delete_rw('."'".$li->id."'".')">
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
		$this->my->delete($this->input->post('id', true));
		echo json_encode(["status" => TRUE]);
	}
	

}

/* End of file Category.php */
