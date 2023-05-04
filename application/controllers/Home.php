<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
   
   public function __construct()
   {
      parent::__construct();
      $this->load->model('identity_model', 'identity', true);
      $this->load->model('banner_model', 'banner', true);
      $this->load->model('posting_model', 'posting', true);
      $this->load->model('category_model', 'category', true);
		$this->load->model('umkm_model', 'umkm', true);
   }
   
   public function index()
   {
      $data['favicon']     = $this->identity->getIdentity();
      $data['title']       = 'Home';
      
      
      $data['umkm']      = $this->umkm->getLastUMKM();
      // $data['trending']    = $this->posting->getThread();
      $data['lastNews']    = $this->posting->getLastNews();
      
      $data['category']    = $this->category->getCategory();

      $data['page'] = 'home';
      $this->load->view('front/layouts/app', $data);
   }    
   
}

/* End of file Home.php */
