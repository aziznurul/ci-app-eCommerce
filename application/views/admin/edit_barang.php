<div class="container-fluid">
  <h3><i class="fas fa-edit">EDIT DATA BARANG</i></h3>
  <?php foreach ($barang as $brg) : ?>
    <form method="post" action="<?= base_url() . 'admin/data_barang/update' ?>">
      <div class="form-group">
        <input type="hidden" name="id_barang" id="id_barang" class="form-control" value="<?= $brg->id_barang; ?>">
        <label for="nama_barang">Nama Barang:</label>
        <input type="text" name="nama_barang" id="nama_barang" class="form-control" value="<?= $brg->nama_barang; ?>">
      </div>

      <div class="form-group">
        <label for="keterangan">Keterangan:</label>
        <input type="text" name="keterangan" id="keterangan" class="form-control" value="<?= $brg->keterangan; ?>">
      </div>

      <div class="form-group">
        <label for="kategori">Kategori:</label>
        <input type="text" name="kategori" id="kategori" class="form-control" value="<?= $brg->kategori; ?>">
      </div>

      <div class="form-group">
        <label for="harga">Harga:</label>
        <input type="number" name="harga" id="harga" class="form-control" value="<?= $brg->harga; ?>">
      </div>

      <div class="form-group">
        <label for="stok">Stok:</label>
        <input type="number" name="stok" id="stok" class="form-control" value="<?= $brg->stok; ?>">
      </div>

      <button type="submit" class="btn btn-primary btn-sm">Simpan</button>

    </form>
  <?php endforeach; ?>
</div>