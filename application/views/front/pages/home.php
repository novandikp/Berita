<!--================ Home Banner Area =================-->
<div class="align-items-center my-5 img-carousel">
	<img class="img-fluid mb-0"  src="<?= base_url("images/brand/header.jpeg") ?>" alt="">
	<div class="image-text text-white">
	<h3 class="font-weight-bold mb-3">Apa itu SIPULANG ?</h3>
	<p>SIPULANG (Sistem Informasi Potensi UMKM Kelurahan Gunung Anyar) adalah sebuah platform yang digunakan untuk memberikan informasi tentang potensi UMKM (Usaha Mikro Kecil Menengah) di Kelurahan Gunung Anyar, Surabaya, Indonesia.</p>
	</div>
</div>

<!--================ End Home Banner Area =================-->
<!--================ UMKM Area =================-->
<section class="choice_area mt-4">
   <div class="container">
      <div class="main_title2">
         <h2>UMKM	</h2>
      </div>
      <div class="row choice_inner">
		
         <?php foreach($umkm as $c) : ?>
            <div class="col-lg-3">
               <div class="choice_item">
                  <img class="img-fluid choice" src="<?= base_url("images/umkm/$c->cover") ?>" alt="">
                  <div class="choice_text">
                     <div class="date">
                        <a class="gad_btn" href="<?= base_url("umkm/rw/".$c->id_rw) ?>">RW <?= $c->rw ?></a>
                     </div>
                     <a href="<?= base_url("umkm/detail/$c->id") ?>"
                        ><h4><?= $c->nama_umkm ?></h4>
                     </a>
                     <p><?= character_limiter($c->deskripsi, 100) ?></p>
                  </div>
               </div>
            </div>
         <?php endforeach ?>
			<div class="col-lg-12 more-btn-umkm">
        <div class="mb-2">
		  <a href="<?= base_url('umkm') ?>" class="genric-btn danger-border circle arrow">More View<span class="lnr lnr-arrow-right"></span></a>
        </div>
    </div>	
      </div>
   </div>
</section>
<!--================End UMKM Area =================-->

<!--================News Area =================-->
<section class="news_area mt-5">
   <div class="container">
      <div class="row">
         <div class="col-lg-8">

            <!-- Last News -->
            <div class="main_title2">
               <h2>Last News</h2>
            </div>
            <div class="latest_news">
               <?php foreach($lastNews as $ln)  :?>
                  <div class="media">
                     <div class="d-flex">
                        <img class="img-fluid" src="<?= base_url("images/posting/medium/$ln->photo") ?>" alt="">
                     </div>
                     <div class="media-body">
                        <div class="choice_text">
                           <div class="date">
                              <a class="gad_btn" href="<?= base_url("blog/category/$ln->slug") ?>"><?= $ln->category_name ?></a>
                              <a href="<?= base_url("blog/read/$ln->seo_title") ?>" class="float-right"><i class="fa fa-calendar" aria-hidden="true">
                                 </i><?= mediumdate_indo($ln->date) ?>
                              </a>
                           </div>
                           <a href="<?= base_url("blog/read/$ln->seo_title") ?>">
                              <h4><?= $ln->title ?></h4>
                           </a>
                           <p><?= character_limiter($ln->content, 100) ?></p>
                        </div>
                     </div>
                  </div>
               <?php endforeach ?>
            </div>
            <!-- End of Last News -->

            <div class="row my-3">
               <div class="col text-center">
                  <a href="<?= base_url('blog') ?>" class="genric-btn danger-border circle arrow">More View<span class="lnr lnr-arrow-right"></span></a>
               </div>
            </div>
          
         </div>      
         
         <!-- ================Sidebar================== -->
         <?php $this->load->view('front/layouts/_sidebar') ?>
         <!-- ================End of Sidebar================== -->
         
      </div>
   </div>
</section>
<!--================End News Area =================-->
