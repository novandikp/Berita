<?php
   $this->load->model('category_model', 'category', true);
   $navbar   = $this->category->getCategory();
	$sub 	 = $this->uri->segment(1);
   $category = $this->uri->segment(3);
?>

<nav class="navbar navbar-light navbar-expand-lg navbar-light bg-light fixed-top home">
   <div class="container">
      <a href="<?= base_url() ?>" class="navbar-brand d-flex w-50 mr-auto">
      <img src="<?= base_url('images/brand/logo-via-logohub.png') ?>" alt="">
      </a>
		
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
          <span class="navbar-toggler-icon"></span>
      </button>
		<!-- add button search show in mobile -->
		
      <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
         <ul class="navbar-nav w-100 justify-content-center">
				  <li class="nav-item <?=empty($sub) ? 'active' :'' ?>">
                  <a class="nav-link " href="<?= base_url("") ?>">Home</a>
               </li>
					<li class="nav-item <?=$sub == 'umkm' ? 'active' :'' ?>">
                  <a class="nav-link" href="<?= base_url("umkm") ?>">UMKM</a>
               </li>
            <?php foreach($navbar as $n) : ?>
               <li class="nav-item <?php if($n->slug === $category ) { echo "active"; } ?> ">
                  <a class="nav-link" href="<?= base_url("blog/category/$n->slug") ?>"><?= $n->category_name ?></a>
               </li>
            <?php endforeach ?>
         </ul> 
         <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
            <li class="nav-item">
               <a class="nav-link" onclick="openSearch()">
						<!-- show only mobile -->
						
                  <i class="fa fa-search"></i>
						<span class="ml-2 d-inline d-sm-none">Cari</span>
               </a>
            </li>
         </ul>
      </div>
   </div>
</nav>
