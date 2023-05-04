<?php 
   $url = $this->uri->segment(3);
	$suburl = $this->uri->segment(2);
   if(isset($url) && isset($suburl)){
		if($suburl == 'rw'){
				// get rw name
				$this->db->where('id', $url);
				$query = $this->db->get('rw')->row();
				$title = "di RW " . $query->rw;
		}
   }else{
      $title = '';
   }
?>

<!--================News Area =================-->
<section class="news_area p_100">
   <div class="container">
      <div class="row">
         <div class="col-lg-8">
            <div class="main_title2">
               <h2>Semua UMKM <?= $title ?></h2>
            </div>
            <div class="latest_news">
               <?php foreach($post as $p)  :?>
                  <div class="media">
                     <div class="d-flex">
                        <img class="img-fluid" src="<?= base_url("images/umkm/$p->cover") ?>" alt="">
                     </div>
                     <div class="media-body">
                        <div class="choice_text">
                           <div class="date">
                              <a class="gad_btn" href="<?= base_url("umkm/detail/".$p->id) ?>">RW <?= $p->rw ?></a>
                           </div>
                           <a href="<?= base_url("umkm/detail/".$p->id) ?>">
                              <h4><?= $p->nama_umkm?></h4>
                           </a>
                           <p><?= character_limiter($p->deskripsi, 150) ?></p>
                        </div>
                     </div>
                  </div>
               <?php endforeach ?>
            </div>

            <!-- Pagination -->
            <div class="row mt-5">
               <div class="col">
                  <nav aria-label="Page navigation example">
                     <?= $pagination ?>
                  </nav>
               </div> 
            </div>
            <!-- End of Pagination -->
            
         </div>
         <!-- ================Sidebar================== -->
         <?php $this->load->view('front/layouts/_sidebar') ?>
         <!-- ================End of Sidebar================== -->
      </div>
   </div>
</section>
<!--================End News Area =================-->
