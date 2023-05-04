<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Cari extends CI_Controller {
   
   public function __construct()
   {
      parent::__construct();
      $this->load->model('identity_model', 'identity', true);
      $this->load->model('banner_model', 'banner', true);
      $this->load->model('posting_model', 'posting', true);
      $this->load->model('category_model', 'category', true);
		$this->load->model('umkm_model', 'umkm', true);
   }
   
   public function index($page = null )
	{
		$tipe = null;
		$keyword = $this->input->get('keyword', true);
		

      $data['favicon']     = $this->identity->getIdentity();
      $data['title']       = 'UMKM';
		$data['tipe']        = $tipe;
      $data['navbar']      = $this->category->getCategory();
      $data['banner']      = $this->banner->getBanner();
      $data['category']    = $this->category->getCategory();
		$data['cari']        = $keyword;
      
		if($tipe != 'post'){
			$data['umkm']        = $this->umkm->searchUMKM($keyword,$page);
			$data['total_rows_umkm']  = $this->umkm->countUMKMSearch($keyword);
			$data['pagination_umkm']  = $this->umkm->makePaginationSearch(
				base_url('cari/umkm'), 2, $data['total_rows_umkm']
			);
		}

		if($tipe != 'umkm'){
			$data['post']        = $this->posting->getSearchPosting($keyword,$page);
			$data['total_rows_post']  = $this->posting->countPostingSearch($keyword);
			$data['pagination_post']  = $this->posting->makePaginationSearch(
				base_url('cari/post'), 2, $data['total_rows_post']
			);
		}
		

		

      $data['page'] = 'cari';
      $this->load->view('front/layouts/app', $data);
   } 
   public function umkm($page = null )
   {
	   $keyword = $this->input->get('keyword', true);
	   $tipe='umkm';

	 $data['favicon']     = $this->identity->getIdentity();
	 $data['title']       = 'UMKM';
	   $data['tipe']        = $tipe;
	 $data['navbar']      = $this->category->getCategory();
	 $data['banner']      = $this->banner->getBanner();
	 $data['category']    = $this->category->getCategory();
	   $data['cari']        = $keyword;
	 
	   if($tipe != 'post'){
		   $data['umkm']        = $this->umkm->searchUMKM($keyword,$page);
		   $data['total_rows_umkm']  = $this->umkm->countUMKMSearch($keyword);
		   $data['pagination_umkm']  = $this->umkm->makePaginationSearch(
			   base_url('cari/umkm'), 3, $data['total_rows_umkm']
		   );
	   }	   

	   

	 $data['page'] = 'cari';
	 $this->load->view('front/layouts/app', $data);
  }
  
  public function post($page = null )
	{
		$tipe = 'post';
		$keyword = $this->input->get('keyword', true);
		

      $data['favicon']     = $this->identity->getIdentity();
      $data['title']       = 'UMKM';
		$data['tipe']        = $tipe;
      $data['navbar']      = $this->category->getCategory();
      $data['banner']      = $this->banner->getBanner();
      $data['category']    = $this->category->getCategory();
		$data['cari']        = $keyword;
      
		if($tipe != 'umkm'){
			$data['post']        = $this->posting->getSearchPosting($keyword,$page);
			$data['total_rows_post']  = $this->posting->countPostingSearch($keyword);
			$data['pagination_post']  = $this->posting->makePaginationSearch(
				base_url('cari/post'), 3, $data['total_rows_post']
			);
		}
		

		

      $data['page'] = 'cari';
      $this->load->view('front/layouts/app', $data);
   } 

}

/* End of file Blog.php */
