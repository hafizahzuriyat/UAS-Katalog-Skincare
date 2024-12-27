class Items {
  final String id;
  final String nama;
  final String deskripsi;
  final String harga;

  Items({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      id: json['id'] ?? '',
      nama: json['nama'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      harga: json['harga']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'deskripsi': deskripsi,
      'harga': harga,
    };
  }
}