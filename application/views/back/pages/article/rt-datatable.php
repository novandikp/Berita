<script type="text/javascript">

   let tableRt;

  // Show Table
   $(document).ready(function(){
      tableRt = $('#tableRt').DataTable({
         processing: true,
         serverSide: true,
         order: [],
         ajax: {
            'url': "<?= base_url('back/Rt/ajax_list') ?>",
            'type': "POST"
         },
         columnDefs: [
            { 
               'targets': [ 0, -1 ], 
               'orderable': false, 
            }
         ],
      });
   });

   // Reload Button
  function reload_table(){
    tableRt.ajax.reload(null, false);
  }

   // Save Button Modal
   function save(){
      $('#btn_save').text('Saving...');
      $('#btn_save').attr('disabled', true);

      $.ajax({
         type: 'post',
         dataType: 'json',
         url: '<?= base_url('back/Rt/action') ?>',
         data: $('#form').serialize(),
         success: function(data){
            if(data.status){
               $('#modalRt').modal('hide');
               Swal.fire({
                  icon: 'success',
                  title: 'Success',
                  showConfirmButton: true
               });
               tableRt.draw();
            }
            $('#btn_save').text('Simpan');
            $('#btn_save').attr('disabled', false);
         },
         error: function(){
            Swal.fire({
               icon: 'error',
               title: 'Oops...',
               text: 'Terjadi Suatu Kesalahan!',
               showConfirmButton: true
            });
            $('#modalRt').modal('hide');
            $('#btn_save').text('Simpan');
            $('#btn_save').attr('disabled', false);
         }
      }); 
   }

   // Add Menu
   function add_rt(){
		if ($('select[name="id_rw"] option').length == 0) {
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: 'Tidak ada RW yang terdaftar!',
				showConfirmButton: true
			});
			return false;
		}
      $('#form')[0].reset();
      $('.modal-title').text('Tambah Kategori');
      $('#modalRt').modal('show');
   }

   //Edit  
   function edit_rt(id){
      method = 'update';
      $.ajax({
         url : '<?= base_url('back/Rt/get_data/') ?>',
         data: {id :id},
         type: 'post',
         dataType: 'json',
         success: function(data){
            $('[name="id"]').val(data.id);
            $('[name="rt"]').val(data.rt);
				$('select[name="id_rw"] option').removeAttr("selected")
				$('select[name="id_rw"] option[value="'+ data.id_rw +'"]').attr("selected",true)
            $('.modal-title').text('Edit Menu');
            $('#modalRt').modal('show');
         },
      });
   }

   // Delete Menu
   function delete_rt(id){
      Swal.fire({
         title: 'Apakah anda yakin?',
         icon: 'warning',
         showCancelButton: true,
         confirmButtonColor: '#3085d6',
         cancelButtonColor: '#d33',
         confirmButtonText: 'Hapus!'
         }).then((result) => {
         if (result.value) {
            $.ajax({
               type: 'post',
               dataType: 'json',
               url: '<?= base_url('back/Rt/delete'); ?>',
               data: {
                  id: id
               },
               success: function(data){
                  if(data.status){
                     tableRt.row( $(this).parents('tr') ).remove().draw();
                     $('#modalRt').modal('hide');
                     Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        showConfirmButton: true
                     });
                  }
               },
               error: function(){
                  $('#modalRt').modal('hide');
                  Swal.fire({
                     icon: 'error',
                     title: 'Oops...',
                     text: 'Terjadi Suatu Kesalahan!',
                     showConfirmButton: true
                  });
               }
            });
         }
      });
   }

</script>
