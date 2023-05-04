<script type="text/javascript">

   let tableRw;

  // Show Table
   $(document).ready(function(){
      tableRw = $('#tableRw').DataTable({
         processing: true,
         serverSide: true,
         order: [],
         ajax: {
            'url': "<?= base_url('back/Rw/ajax_list') ?>",
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
    tableRw.ajax.reload(null, false);
  }

   // Save Button Modal
   function save(){
      $('#btn_save').text('Saving...');
      $('#btn_save').attr('disabled', true);

      $.ajax({
         type: 'post',
         dataType: 'json',
         url: '<?= base_url('back/Rw/action') ?>',
         data: $('#form').serialize(),
         success: function(data){
            if(data.status){
               $('#modalRw').modal('hide');
               Swal.fire({
                  icon: 'success',
                  title: 'Success',
                  showConfirmButton: true
               });
               tableRw.draw();
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
            $('#modalRw').modal('hide');
            $('#btn_save').text('Simpan');
            $('#btn_save').attr('disabled', false);
         }
      }); 
   }

   // Add Menu
   function add_rw(){
      $('#form')[0].reset();
      $('.modal-title').text('Tambah Kategori');
      $('#modalRw').modal('show');
   }

   //Edit  
   function edit_rw(id){
      method = 'update';
      $.ajax({
         url : '<?= base_url('back/Rw/get_data/') ?>',
         data: {id :id},
         type: 'post',
         dataType: 'json',
         success: function(data){
            $('[name="id"]').val(data.id);
            $('[name="rw"]').val(data.rw);

            $('.modal-title').text('Edit Menu');
            $('#modalRw').modal('show');
         },
      });
   }

   // Delete Menu
   function delete_rw(id){
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
               url: '<?= base_url('back/Rw/delete'); ?>',
               data: {
                  id: id
               },
               success: function(data){
                  if(data.status){
                     tableRw.row( $(this).parents('tr') ).remove().draw();
                     $('#modalRw').modal('hide');
                     Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        showConfirmButton: true
                     });
                  }
               },
               error: function(){
                  $('#modalRw').modal('hide');
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
