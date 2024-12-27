import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/barang_provider.dart';

class BarangPage extends StatefulWidget {
  const BarangPage({super.key});

  @override
  _BarangPageState createState() => _BarangPageState();
}

class _BarangPageState extends State<BarangPage> {
  @override
  void initState() {
    super.initState();
    // Memastikan barang data dimuat saat widget pertama kali ditampilkan
    Provider.of<BarangProvider>(context, listen: false).fetchBarang();
  }

  Future<void> _showAddBarangDialog(BuildContext context) async {
    final namaController = TextEditingController();
    final deskripsiController = TextEditingController();
    final hargaController = TextEditingController();

    final barangProvider = Provider.of<BarangProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Tambah Barang'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: 'Nama Barang'),
                ),
                TextField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(labelText: 'Deskripsi Barang'),
                ),
                TextField(
                  controller: hargaController,
                  decoration: const InputDecoration(labelText: 'Harga'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final success = await barangProvider.addBarang(
                  nama: namaController.text,
                  deskripsi: deskripsiController.text,
                  harga: int.tryParse(hargaController.text) ?? 0,
                );

                // Memastikan widget masih aktif sebelum menampilkan notifikasi
                if (mounted) {
                  Navigator.of(ctx).pop();
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Barang berhasil ditambahkan')),
                    );
                    // Refresh list after adding
                    barangProvider.fetchBarang();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Gagal menambahkan barang')),
                    );
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showEditBarangDialog(BuildContext context, var barang) async {
    final namaController = TextEditingController(text: barang.nama);
    final deskripsiController = TextEditingController(text: barang.deskripsi);
    final hargaController = TextEditingController(text: barang.harga.toString());

    final barangProvider = Provider.of<BarangProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Edit Barang'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: 'Nama Barang'),
                ),
                TextField(
                  controller: deskripsiController,
                  decoration: const InputDecoration(labelText: 'Deskripsi Barang'),
                ),
                TextField(
                  controller: hargaController,
                  decoration: const InputDecoration(labelText: 'Harga'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () async {
                final success = await barangProvider.editBarang(
                  id: barang.id,
                  nama: namaController.text,
                  deskripsi: deskripsiController.text,
                  harga: int.tryParse(hargaController.text) ?? 0,
                );

                // Memastikan widget masih aktif sebelum menampilkan notifikasi
                if (mounted) {
                  Navigator.of(ctx).pop();
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Barang berhasil diperbarui')),
                    );
                    barangProvider.fetchBarang();  // Refresh list after editing
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Gagal memperbarui barang')),
                    );
                  }
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context, String id) async {
    final barangProvider = Provider.of<BarangProvider>(context, listen: false);

    final confirm = await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('Konfirmasi Hapus'),
          content: const Text('Apakah Anda yakin akan menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop(false);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );

    if (confirm == true && mounted) {
      final success = await barangProvider.deleteBarang(id);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Barang berhasil dihapus')),
        );
        barangProvider.fetchBarang(); // Refresh list after deleting
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gagal menghapus barang')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final barangProvider = Provider.of<BarangProvider>(context);

    return Scaffold(
      body: barangProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : barangProvider.barangList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tidak ada data barang.'),
                      ElevatedButton(
                        onPressed: () {
                          barangProvider.fetchBarang();
                        },
                        child: const Text('Coba Lagi'),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: barangProvider.barangList.length,
                  itemBuilder: (context, index) {
                    final barang = barangProvider.barangList[index];
                    return GestureDetector(
                      onTap: () {
                        _showEditBarangDialog(context, barang);
                      },
                      child: Card(
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          title: Text(barang.nama),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Deskripsi: ${barang.deskripsi}'),
                              Text('Harga: Rp${barang.harga}'),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _confirmDelete(context, barang.id);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddBarangDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}