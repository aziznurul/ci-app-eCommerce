<div class="container-fluid">
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="<?= base_url('assets/img/slider1.jpg') ?>" class="d-block w-100" alt="slide 1">
      </div>
      <div class="carousel-item">
        <img src="<?= base_url('assets/img/slider2.jpg') ?>" class="d-block w-100" alt="slide 2">
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-target="#carouselExampleIndicators" data-slide="prev" style="border: 0px;background: none;">
      <span class=" carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-target="#carouselExampleIndicators" data-slide="next" style="border: 0px;background: none;">
      <span class=" carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </button>
  </div>
  <div class="row text-center mt-4">
    <?php foreach ($pakaian_anak_anak as $brg) : ?>
      <div class="card ml-3 mb-3" style="width: 16rem;">
        <img src="<?= base_url() . '/uploads/' . $brg->gambar ?>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title mb-1"><?= $brg->nama_barang; ?></h5>
          <small><?= $brg->keterangan; ?></small><br>
          <span class="badge badge-pill badge-success mb-3">Rp. <?= number_format($brg->harga, 0, ',', '.'); ?></span>

          <?php echo anchor('dashboard/tambah_ke_keranjang/' . $brg->id_barang, '<div class="btn btn-sm btn-primary"> Tambah ke keranjang </div>') ?>
          <?php echo anchor('dashboard/detail/' . $brg->id_barang, '<div class="btn btn-sm btn-success"> Detail </div>') ?>
        </div>
      </div>
    <?php endforeach; ?>
  </div>
</div>