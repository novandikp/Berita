<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Umkm extends CI_Controller {
   
   public function __construct()
   {
      parent::__construct();
      $this->load->model('identity_model', 'identity', true);
      $this->load->model('banner_model', 'banner', true);
      $this->load->model('posting_model', 'posting', true);
      $this->load->model('category_model', 'category', true);
		$this->load->model('umkm_model', 'umkm', true);
   }
   
   public function index($page = null)
   {
      $data['favicon']     = $this->identity->getIdentity();
      $data['title']       = 'UMKM';
      $data['navbar']      = $this->category->getCategory();
      $data['banner']      = $this->banner->getBanner();
      $data['category']    = $this->category->getCategory();
      $data['post']        = $this->umkm->getAllUMKM($page);
      $data['category']    = $this->category->getCategory();
      $data['total_rows']  = $this->umkm->countUMKM();
      $data['pagination']  = $this->umkm->makePagination(
         base_url('umkm'), 2, $data['total_rows']
      );

      $data['page'] = 'umkm';
      $this->load->view('front/layouts/app', $data);
   } 

   public function rw($rw, $page = null)
   {
      $data['favicon']     = $this->identity->getIdentity();
      $data['title']       = 'Blog';
      $data['category']    = $this->category->getCategory();
      $data['post']        = $this->umkm->getAllUMKMByRW($rw, $page);
      $data['total_rows']  = $this->umkm->countUMKM($rw);
		$data['pagination']  = $this->umkm->makePagination(
         base_url('umkm/rw'), 2, $data['total_rows']
      );
      $data['page'] = 'umkm';
      $this->load->view('front/layouts/app', $data);
   }

	public function detail($id){
		$row = $this->umkm->getUMKMById($id);
		if($row){
			$data['umkm']     = $row;
			$data['title']       = $row->nama_umkm;
			$data['favicon']     = $this->identity->getIdentity();
			$data['banner']      = $this->banner->getBanner();
			$data['category']    = $this->category->getCategory();
			$data['page']        = 'umkm-detail';
			$this->load->view('front/layouts/app', $data);
			}else{
				redirect(base_url('umkm'));
			}
	}
}

/* End of file Blog.php */
