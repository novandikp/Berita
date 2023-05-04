<div class="col-lg-4">
   <div class="right_sidebar">
	<?php if(!empty($tokopedia)  || !empty($whatsapp)  || !empty($shopee)  || !empty($facebook)  || !empty($gojek) || !empty($grab)): ?>
      <aside class="r_widgets social_widgets">
         <div class="main_title2">
            <h2>Kontak Pedagang</h2>
         </div>
         <ul class="list">
				
				<?php if(!empty($tokopedia)): ?>
            	<li><a href="#"><img class="icon-sosmed" src="https://4.bp.blogspot.com/-VGr7kKhpibQ/YYtxvLOGH8I/AAAAAAAASvs/60b31jcrE9IuQZJ6KIjMNdO1ym7fezInACLcBGAsYHQ/s16000/logo%2Blogo%2Btokopedia%2Bputih.png"/>Tokopedia</a></li>
				<?php endif; ?>
				<?php if(!empty($whatsapp)): ?>
            <li><a href="#"><img class="icon-sosmed" src="https://cdn.iconscout.com/icon/free/png-256/whatsapp-circle-1868968-1583132.png"/>Whatsapp</a></li>
				<?php endif; ?>
				<?php if(!empty($shopee)): ?>
				<li><a href="#"><img class="icon-sosmed" src="https://logospng.org/download/shopee/logo-shopee-icon-256.png"/>Shopee</a></li>
				<?php endif; ?>
				<?php if(!empty($facebook)): ?>
				<li><a href="#"><img class="icon-sosmed" src="https://cdn.iconscout.com/icon/free/png-256/facebook-logo-2019-1597680-1350125.png"/>Facebook</a></li>
				<?php endif; ?>
				<?php if(!empty($gojek)): ?>
				<li><a href="#"><img class="icon-sosmed" src="https://4.bp.blogspot.com/-VIktCMLpArU/YZjCswH0syI/AAAAAAAAS6U/XP6-ac2i1iw2EoRr_DMyaLoo8fzlFuu0ACLcBGAsYHQ/s16000/lambang%2Bgojek.png"/>Gojek</a></li>
				<?php endif; ?>
				<!-- grab -->
				<?php if(!empty($grab)): ?>
				<li><a href="#"><img class="icon-sosmed" src="https://cdn.iconscout.com/icon/free/png-256/grab-282266.png?f=webp&w=256"/>Grab</a></li>
				<?php endif; ?>
			
         </ul>
      </aside>
		<?php endif; ?>
		<?php if(!empty($lokasi)): ?>
      <aside class="r_widgets px-1">
         <div class="main_title2">
            <h2>Temukan Kami</h2>
         </div>			
			<!-- add iframe from $lokasi -->
			<div class="map-container">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.0070000000003!2d106.8241583147693!3d-6.175000995499999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f0f2f2f2f2f2%3A0x2e69f0f2f2f2f2f2!2s<?=urlencode($lokasi)?>!5e0!3m2!1sid!2sid!4v1629200000000!5m2!1sid!2sid" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
			</div>
      </aside>
		<?php endif; ?>
   </div>
</div>
