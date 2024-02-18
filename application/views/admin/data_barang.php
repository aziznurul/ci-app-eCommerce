<div class="container-fluid">
  <button class="btn btn-sm btn-primary mb-3" data-toggle="modal" data-target="#tambah_barang"> <i class="fas fa-plus fa-sm"></i>Tambah Barang</button>

  <table class="table table-bordered">
    <tr>
      <th>NO</th>
      <th>NAMA BARANG</th>
      <th>KETERANGAN</th>
      <th>KATEGORI</th>
      <th>HARGA</th>
      <th>STOK</th>
      <th colspan="3">AKSI</th>
    </tr>

    <?php
    $no = 1;
    foreach ($barang as $brg) : ?>
      <tr>
        <td><?= $no++ ?> </td>
        <td><?= $brg->nama_barang ?> </td>
        <td><?= $brg->keterangan ?> </td>
        <td><?= $brg->kategori ?> </td>
        <td><?= $brg->harga ?> </td>
        <td><?= $brg->stok ?> </td>

        <td><?php echo anchor('admin/data_barang/detail/' . $brg->id_barang, '
          <div class="btn btn-success btn-sm"><i class="fas fa-search-plus"></i></div>') ?>
        </td>

        <td><?php echo anchor('admin/data_barang/edit/' . $brg->id_barang, '
          <div class="btn btn-primary btn-sm"><i class="fa fa-edit"></i></div>') ?>
        </td>

        <td><?php echo anchor('admin/data_barang/hapus/' . $brg->id_barang, '
          <div class="btn btn-danger btn-sm"><i class="fa fa-trash"></i></div>') ?>
        </td>
      </tr>

    <?php endforeach; ?>
  </table>


</div>

<!-- Modal -->
<div class="modal fade" id="tambah_barang" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">FORM INPUT PRODUK</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="<?= base_url() . 'admin/data_barang/tambah_aksi' ?>" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="nama_barang">Nama Barang:</label>
            <input type="text" name="nama_barang" id="nama_barang" class="form-control">
          </div>

          <div class="form-group">
            <label for="keterangan">Keterangan:</label>
            <input type="text" name="keterangan" id="keterangan" class="form-control">
          </div>

          <div class="form-group">
            <label for="kategori">Kategori:</label>
            <select class="form-control" name="kategori" id="kategori">
              <option>Elektronik</option>
              <option>Pakaian Pria</option>
              <option>Pakaian Wanita</option>
              <option>Pakaian Anak-anak</option>
              <option>Peralatan Olahraga</option>
            </select>
          </div>

          <div class="form-group">
            <label for="harga">Harga:</label>
            <input type="number" name="harga" id="harga" class="form-control">
          </div>

          <div class="form-group">
            <label for="stok">Stok:</label>
            <input type="number" name="stok" id="stok" class="form-control">
          </div>

          <div class="form-group">
            <label for="gambar">Gambar:</label>
            <input type="file" name="gambar" id="gambar" class="form-control">
          </div>



      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Simpan</button>
      </div>
      </form>
    </div>
  </div>
</div>