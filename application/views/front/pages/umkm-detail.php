<!--================Home Banner Area =================-->
<section style="position: relative;
    z-index: 1;
    min-height: 35px;">
</section>
<!--================End Home Banner Area =================-->

<!--================News Area =================-->
<section class="news_area single-post-area mt-5">
   <div class="container">
      <div class="row">
         <div class="col-lg-8">
            <div class="main_blog_details mb-4">
			

               <img class="img-fluid" src="<?= base_url("images/umkm/$umkm->cover") ?>" alt="">
               <h4 class="mt-3 mb-1"><?= $umkm->nama_umkm ?></h4>
					<?php if(!empty($umkm->lokasi)):?>
               <a href="<?=$umkm->link_gmaps?>" class="d-block mb-3 location-text"><i class="fa fa-map-marker mr-1" aria-hidden="true"></i> <?= $umkm->lokasi ?></a>
					<?php endif ?>
					<!-- buat tabel identitas umkm -->
					<a class="gad_btn mb-1" href="<?= base_url("umkm/rw/$umkm->id_rw") ?>">RW <?= $umkm->rw ?></a>
					<!-- icon marker -->
					<p><?= $umkm->deskripsi ?></p>
					<!-- text heading gambar lainnya -->
					<?php if(count($umkm->album) > 0): ?>
						
					<h4 style="font-size: 24px;" class="display-2 mt-4 mb-3">Foto Lainnya</h4>
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<?php foreach($umkm->album as $key => $album) : ?>
								<li data-target="#myCarousel" data-slide-to="<?= $key ?>" class="<?= $key == 0 ? 'active' : '' ?>"></li>
							<?php endforeach ?>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" id="album-umkm">
							<?php foreach($umkm->album as $key => $album) : ?>
								<div class="carousel-item <?= $key == 0 ? 'active' : '' ?>">
									<img class="img-fluid" src="<?= base_url("images/umkm/$album->gambar") ?>" alt="<?= $album->gambar ?>">
								</div>
							<?php endforeach ?>
							
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#myCarousel" data-slide="next">
							<span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span>
						</a>
				
					</div>
            <?php endif ?>  
            </div>
         </div>
         
         <!-- ================Sidebar================== -->
         <?php $this->load->view('front/layouts/_sidebar_umkm',$umkm) ?>
         <!-- ================End of Sidebar================== -->

      </div>
   </div>
</section>
<!--================End News Area =================-->
	