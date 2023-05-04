<div class="container">
   <div class="row">
      <div class="col">
         <h3 class="page-header">Manajemen RT</h3>
      </div>
   </div>

   <div class="row mt-3">
      <div class="col">
         <button type="buton" class="btn btn-success btn-sm" onclick="add_rt()">
            <i class="fas fa-plus"></i> Tambah
         </button>

         <button class="btn btn-outline-secondary btn-sm" onclick="reload_table()">
               <i class="fas fa-sync-alt"></i> Reload
         </button>
      </div>
   </div>


  <br>

   <div class="table-responsive">
      <table id="tableRt" class="table table-striped table-bordered"  cellspacing="0" width="100%">
         <thead>
         <tr>
            <th>#</th>
            <th>Nama RT</th> 
				<th>Nama RW</th> 
            <th>Action</th>
         </tr>
         </thead>
         <tbody>
         
         </tbody>
      </table>
   </div>

</div>

<!-- Modal -->
<div class="modal fade" id="modalRt" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
   <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="modal-title">Edit Kategori</h5>
         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
         </button>
         </div>
         <div class="modal-body">
            <form action="#" class="form-horizontal" id="form">
            
               <input type="hidden" name="id" id="id">

               <div class="form-group row">
                  <label for="rt" class="col-sm-3 col-form-label">Nama RT</label>
                  <div class="col-sm-9">
                  <input type="text" class="form-control" id="rt" name="rt">
                  </div>
               </div> 

					<div class="form-group row">
                  <label for="rw" class="col-sm-3 col-form-label">Nama RW</label>
                  <div class="col-sm-9">
                  <select class="form-control" name="id_rw">
							<?php foreach($rw as $key => $value): ?>
							<option value="<?=$value->id?>"><?=$value->rw?></option>
							<?php endforeach; ?>
						</select>
                  </div>
               </div> 
            </form>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">Tutup</button>
            <button type="button" class="btn btn-sm btn-primary" onclick="save()" id="btn_save">Simpan</button>
         </div>
      </div>
   </div>
</div>
