<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Admin - Garsansnews.com</title>

	<!-- Font Awesome -->
	<link href="<?= base_url("assets/back/vendors/fontawesome-free/css/all.min.css") ?>" rel="stylesheet" type="text/css">
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<!-- Datatables -->
	<link href="<?= base_url("assets/back/vendors/datatables/dataTables.bootstrap4.min.css") ?>" rel="stylesheet">
	<!-- Custom styles for this template-->
	<link href="<?= base_url("assets/back/css/sb-admin-2.min.css") ?>" rel="stylesheet">

	<link rel="stylesheet" href="<?= base_url("assets/back/vendors/summernote/dist/summernote-bs4.min.css") ?>">
	<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
	<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
	
	<style>
		.dropzone {
			border: 1px solid #d1d3e2;
			border-radius: 0.35rem;
		}

		.dropzone .dz-preview .dz-image img {
			display: block;
			object-fit: contain;
			width: 90%;
			height: 90%;
			object-fit: cover;
		}
	</style>
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<?php $this->load->view('back/layouts/_sidebar') ?>

		<!-- Content Wrapper -->

		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<?php $this->load->view('back/layouts/_navbar') ?>

				<!-- Begin Page Content -->
				<div class="container">

					<div class="row">
						<div class="col">
							<h3 class="page-header"> <?= isset($input->id) ? 'Edit UMKM' : 'Tambah UMKM' ?></h3>
						</div>
					</div>

					<br>

					<?= form_open_multipart($form_action) ?>

					<!-- <?php var_dump($input) ?> -->

					<?= isset($input->id) ? form_hidden('id', $input->id) : '' ?>
					<div class="form-group row">
						<label for="cover" class="col-sm-2 col-form-label"><span class="text-danger">*</span> Cover</label>
						<div class="col-sm-10">
							<!-- preview -->
							<div class="<?= $input->cover == '' ? 'd-none' : 'd-block' ?>" id="preview">
								<img src="<?= $input->cover == '' ? '' : base_url('images/umkm/') . $input->cover ?>" style="max-height: 200px;" alt="" class="img-fluid my-2">
							</div>

							<?= $input->cover == '' ?
								form_upload('cover', null, ['accept' => 'image/png, image/gif, image/jpeg', 'class' => 'form-control', 'type' => 'file', 'id' => 'cover', 'required' => $input->cover == '', 'autofocus' => true, 'autocomplete' => 'off']) :
								form_upload('cover', null, ['accept' => 'image/png, image/gif, image/jpeg', 'class' => 'form-control', 'type' => 'file', 'id' => 'cover', 'autofocus' => true, 'autocomplete' => 'off'])
							?>
							<?= form_error('cover', '<small class="form-text text-danger">', '</small>') ?>
							<small class="form-text text-muted"><span class="text-danger">*</span> Gambar maksimal berukuran 1 MB</small>
						</div>
					</div>
					<div class="form-group row">
						<label for="nama_umkm" class="col-sm-2 col-form-label"><span class="text-danger">*</span> Nama UMKM</label>
						<div class="col-sm-10">
							<?= form_input('nama_umkm', $input->nama_umkm, ['class' => 'form-control', 'id' => 'nama_umkm', 'required' => true, 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('nama_umkm', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="pemilik" class="col-sm-2 col-form-label"><span class="text-danger">*</span> Pemilik</label>
						<div class="col-sm-10">
							<?= form_input('pemilik', $input->pemilik, ['class' => 'form-control', 'id' => 'pemilik', 'required' => true, 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('pemilik', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">

						<label for="id_rt" class="col-md-2 col-form-label"><span class="text-danger">*</span> RW</label>
						<div class="col-md-4">
							<select class="form-control" id="id_rt" name="id_rt">
								<?php foreach ($rt as $c) : ?>
									<option value="<?= $c->id ?>" <?php if ($c->id == $input->id_rt) {
																		print ' selected';
																	} ?>><?= $c->rt ?></option>
								<?php endforeach ?>
							</select>
							<?= form_error('id_category', '<small class="form-text text-danger">', '</small>') ?>
						</div>
						<label for="status" class="col-md-2 col-form-label"><span class="text-danger">*</span> Status</label>
						<div class="col-md-4">
							<select class="form-control" id="status" name="status">
								<option <?php if ("Y" == $input->status) {
											print ' selected';
										} ?> value="Y">Aktif</option>
								<option <?php if ("N" == $input->status) {
											print ' selected';
										} ?> value="N">Tidak Aktif</option>
							</select>
							<?= form_error('id_category', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">Lokasi</label>
						<div class="col-sm-10">
							<?= form_textarea('lokasi', $input->lokasi, ['row' => 4, 'class' => 'form-control']); ?>
							<?= form_error('lokasi', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">Link Gmaps</label>
						<div class="col-sm-10">
							<?= form_input('link_gmaps', $input->link_gmaps, ['class' => 'form-control', 'id' => 'link_gmaps', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('link_gmaps', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="article" class="col-sm-2 col-form-label"><span class="text-danger">*</span> Deskripsi</label>
						<div class="col-sm-10">
							<?= form_textarea('deskripsi', $input->deskripsi, ['row' => 4, 'class' => 'form-control', 'id' => 'summernote']); ?>
							<?= form_error('deskripsi', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="nib" class="col-sm-2 col-form-label">NIB</label>
						<div class="col-sm-10">
							<!--  Check -->
							<div class="has_nib">
								<input type="checkbox" id="nib_check" checked value="Memiliki NIB" name="nib" />
								<label for="nib_check">Memiliki NIB</label>
							</div>

							<?= form_input('nib', $input->nib, ['class' => 'form-control', 'id' => 'nib', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('nib', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group" id="album_attach">

					</div>

					<h5 class="my-4 font-weight-bold">Sosial Media dan Marketplace</h5>
					<div class="form-group row">
						<label for="whatsapp" class="col-sm-2 col-form-label">Whatsapp</label>
						<div class="col-sm-10">
							<?= form_input('whatsapp', $input->whatsapp, ['class' => 'form-control', 'id' => 'whatsapp', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('whatsapp', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row d-none">
						<label for="shopee" class="col-sm-2 col-form-label">Shopee</label>
						<div class="col-sm-10">
							<?= form_input('shopee', $input->shopee, ['class' => 'form-control', 'id' => 'shopee', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('shopee', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row d-none">
						<label for="tokopedia" class="col-sm-2 col-form-label">Tokopedia</label>
						<div class="col-sm-10">
							<?= form_input('tokopedia', $input->tokopedia, ['class' => 'form-control', 'id' => 'tokopedia', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('tokopedia', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row d-none">
						<label for="facebook" class="col-sm-2 col-form-label">Facebook</label>
						<div class="col-sm-10">
							<?= form_input('facebook', $input->facebook, ['class' => 'form-control', 'id' => 'facebook', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('facebook', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row d-none">
						<label for="gojek" class="col-sm-2 col-form-label">Gojek</label>
						<div class="col-sm-10">
							<?= form_input('gojek', $input->gojek, ['class' => 'form-control', 'id' => 'gojek', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('gojek', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<div class="form-group row">
						<label for="grab" class="col-sm-2 col-form-label">Grab</label>
						<div class="col-sm-10">
							<?= form_input('grab', $input->grab, ['class' => 'form-control', 'id' => 'grab', 'autofocus' => true, 'autocomplete' => 'off']) ?>
							<?= form_error('grab', '<small class="form-text text-danger">', '</small>') ?>
						</div>
					</div>
					<h5 class="my-4 font-weight-bold">Album</h5>

					<div id="myAwesomeDropzone" class="">
						<div class="dz-default dz-message">
							<!-- add text upload and camera image -->
							<div class="dz-icon">
								<i class="fas fa-cloud-upload-alt"></i>
							</div>
							<div class="dz-text">
								<span>Drop files here or Click to upload</span>
							</div>
						</div>
					</div>
					<small class="d-block mb-2"><span class="text-danger">*</span> Gambar hanya terbatas untuk 5 gambar dan minimal 1 mb</small>
					<a href="<?= base_url('admin/umkm') ?>" class="btn btn-sm btn-secondary mt-2 mb-4">Kembali</a>
					<button type="button" id="submit-form" class="btn btn-sm btn-primary float-right mt-2 mb-4">Simpan</button>

					<?= form_close() ?>

				</div>


			</div>
			<!-- End of Main deskripsi -->

			<!-- Footer -->
			<?php $this->load->view('back/layouts/_footer') ?>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>


	<!-- Core JavaScript-->
	<script src="<?= base_url("assets/back/vendors/jquery/jquery.min.js") ?>"></script>
	<script src="<?= base_url("assets/back/vendors/popper/popper.min.js") ?>"></script>
	<script src="<?= base_url("assets/back/vendors/bootstrap/js/bootstrap.min.js") ?>"></script>
	<script src="<?= base_url("assets/back/js/sb-admin-2.js") ?>"></script>

	<!-- Core plugin JavaScript-->
	<script src="<?= base_url("assets/back/vendors/jquery-easing/jquery.easing.min.js") ?>"></script>
	<!-- Summernote -->
	<script src="<?= base_url("assets/back/vendors/summernote/dist/summernote-bs4.min.js") ?>"></script>
	<script src="<?= base_url("assets/back/vendors/sweetalert2/sweetalert2.js") ?>"></script>
	<script>
		$('#summernote').summernote({
			height: 300,
		});
		$("#nib_check").click(function() {
			if ($(this).is(":checked")) {
				$("#nib").show();
				$("#nib").attr("required", "1");
				$("#nib").val("");
			} else {
				$("#nib").hide();
				$("#nib").removeAttr("required");
				$("#nib").val("Tidak Memiliki NIB");
			}
			$("#nib").next('small.error-text').remove();
		});

		<?php if ($input->nib == "") : ?>
			if ($("#nib_check").is(":checked")) {
				$("#nib").show();
				$("#nib").attr("required", "1");
				$("#nib").val("");
			} else {
				$("#nib").hide();
				$("#nib").removeAttr("required");
				$("#nib").val("Tidak Memiliki NIB");
			}
		<?php elseif ($input->nib == "Tidak Memiliki NIB") : ?>
			// unchecked
			$("#nib_check").trigger("click");
		<?php endif; ?>
	</script>
	<script>
		<?php if (isset($input->album) && !empty($input->album)) : ?>
			let exist_album = JSON.parse('<?= json_encode($input->album) ?>');
		<?php else : ?>
			let exist_album = [];
		<?php endif; ?>

		var albumFilesNotInserted = [];
		Dropzone.autoDiscover = false;
		var albumUmkm = new Dropzone('#myAwesomeDropzone', {
			url: "<?= base_url() ?>/back/umkm/upload_album",
			acceptedFiles: "image/*",
			addRemoveLinks: true,
			maxFiles: 5,
			thumbnailMethod: 'contain',
			maxFilesize: 1,
			parallelUploads: 5,
			uploadMultiple: true,
			autoProcessQueue: false,
			//previewsContainer: "#preview",
			dictDefaultMessage: "Drop files here or click to upload",
			thumbnailWidth: 200,
			thumbnailHeight: 200,
			dictRemoveFile: "Hapus file",
			dictMaxFilesExceeded: "Kamu hanya bisa upload 5 file",
			dictFileTooBig: "File terlalu besar ({{filesize}}MiB). Maksimal ukuran file: {{maxFilesize}}MiB.",
			dictInvalidFileType: "Tipe file tidak diizinkan",
			dictCancelUpload: "Batal upload",
			dictCancelUploadConfirmation: "Apakah anda yakin untuk membatalkan upload?",
			dictResponseError: "Server responded with {{statusCode}} code.",
			dictFallbackMessage: "Browser tidak mendukung drag'n'drop file upload.",
			dictFileTooBig: "File terlalu besar ({{filesize}}MiB). Maksimal ukuran file: {{maxFilesize}}MiB.",
			success: function(file, response) {
				if (response) {
					const data = JSON.parse(response);
					data.forEach(function(item) {
						//  push if not exists
						if (!albumFilesNotInserted.includes(item.file_name)) {
							albumFilesNotInserted.push(item.file_name);
						}
					});
				}

				console.log(albumFilesNotInserted);
				if (file.previewElement) {
					return file.previewElement.classList.add("dz-success");
				}

			},
			removedfile: function(file) {
				//sweet alert confirmation

				Swal.fire({
					title: 'Apakah anda yakin?',
					text: "Anda tidak akan dapat mengembalikan file ini!",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Ya, hapus file!'
				}).then((result) => {
					if (result.value) {
						//ajax delete
						albumFilesNotInserted = albumFilesNotInserted.filter(function(item) {
							return item !== file.name
						})

						if (file.isExist) {
							$.ajax({
								url: "<?= base_url() ?>/back/umkm/remove_file_album",
								type: 'POST',
								data: {
									filename: file.name,
									_token: $('meta[name="csrf-token"]').attr('content')
								},
								success: function(data) {
									//sweet alert success
									Swal.fire(
										'Terhapus!',
										'File anda telah dihapus.',
										'success'
									)
									if (file.previewElement != null && file.previewElement.parentNode != null) {
										file.previewElement.parentNode.removeChild(file.previewElement);
									}

									if ($(".dz-preview").length > 0) {
										$('#myAwesomeDropzone').addClass('dz-started');
									} else {
										$('#myAwesomeDropzone').removeClass('dz-started');
									}
								}
							});
						} else {
							// remove item from array file name

							if (file.previewElement != null && file.previewElement.parentNode != null) {
								file.previewElement.parentNode.removeChild(file.previewElement);
							}

							if ($(".dz-preview").length > 0) {
								$('#myAwesomeDropzone').addClass('dz-started');
							} else {
								$('#myAwesomeDropzone').removeClass('dz-started');
							}
						}

					} else {
						if ($(".dz-preview").length > 0) {
							$('#myAwesomeDropzone').addClass('dz-started');
						} else {
							$('#myAwesomeDropzone').removeClass('dz-started');
						}

					}
				})



				return this._updateMaxFilesReachedClass();
			},
			error: function(file, response) {
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: response
				})
				file.previewElement.remove();
				if ($(".dz-preview").length > 0) {
					$('#myAwesomeDropzone').addClass('dz-started');
				} else {
					$('#myAwesomeDropzone').removeClass('dz-started');
				}
			},
			successmultiple: function() {
				$("#album_attach").empty();
				albumFilesNotInserted.forEach(function(item, index) {
					//  push if not exists
					$("#album_attach").append('<input type="hidden" name="attachments[]" value="' + item + '"/>');
				})
				$('form')[0].submit();


			}
		})


		// add exists_album to dropzone
		$.each(exist_album, function(key, value) {
			var mockFile = {
				name: value.gambar,
				size: 12345
			};
			albumUmkm.emit("addedfile", mockFile);
			albumUmkm.emit("thumbnail", mockFile, value.url);
			albumUmkm.emit("complete", mockFile);
			albumUmkm.files.push(mockFile);
			// get last added file
			var lastFile = albumUmkm.files[albumUmkm.files.length - 1];
			lastFile.isExist = true;
			$('#myAwesomeDropzone').addClass('dz-started');
		});

		$('#myAwesomeDropzone').addClass('dropzone');
		// when #cover new file is added show thumbnail
		$('#cover').on('change', function() {
			var file = $(this)[0].files[0];
			var reader = new FileReader();

			// check size of file if > 1MB swal error
			if (file.size > 1000000) {
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: 'File terlalu besar, maksimal 1MB'
				})
				$('#cover').val('');
				return;
			}
			reader.onload = function(e) {
				$('#preview').removeClass("d-none");
				$('#preview').removeClass("d-block");
				$('#preview img').attr('src', e.target.result);
			}
			reader.readAsDataURL(file);
		});
	</script>
	<script>
		// show 
		$(document).ready(function() {
			$('input[required]').on('change', function() {
				$(this).next('small.error-text').remove();
			});
			$('input[required]').on('keydown', function() {
				$(this).next('small.error-text').remove();
			});
			$('#submit-form').on('click', function() {
				let isValidated = true;
				$('input[required]').each(function() {
					if ($(this).val().trim() == '') {
						// submit form
						// add error after input component
						let name = $(this).attr('name');
						//  capitalize first letter
						name = name.charAt(0).toUpperCase() + name.slice(1);
						// replace _ to space
						name = name.replace('_', ' ');
						$(this).after('<small class="text-danger error-text">' + name + ' tidak boleh kosong</small>');
						// focus to input
						$(this).focus();
						isValidated = false;
						return false;
					}
				});
				if (!isValidated) {
					return;
				}
				const deskripsi = $($("#summernote").summernote("code")).text().trim()
				// check if deskripsi is empty
				if (deskripsi == '') {
					Swal.fire({
						icon: 'error',
						title: 'Oops...',
						text: 'Deskripsi tidak boleh kosong'
					})
					$("#summernote").focus()
					return;
				}

				// check all required input

				// konfirmasi
				Swal.fire({
					title: 'Apakah anda yakin?',
					text: "Untuk menyimpan data ini ?",
					icon: 'question',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: 'Ya, simpan data!'
				}).then((result) => {
					if (result.value) {
						// ajax submit
						// swal loading
						//  detect file not queue
						//  if file not queue push to array


						if (albumUmkm.getQueuedFiles().length > 0) {
							Swal.fire({
								title: 'Mohon tunggu',
								html: 'Sedang menyimpan data', // add html attribute if you want or remove
								allowOutsideClick: false,
								onBeforeOpen: () => {},
							});
							albumUmkm.processQueue();
						} else {
							$('form')[0].submit();
						}


					}
				})
			});
		});
	</script>
</body>

</html>
