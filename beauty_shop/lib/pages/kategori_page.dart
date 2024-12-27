import 'package:flutter/material.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'Moisturizer',
      'Sunscreen',
      'Toner',
      'Cushion',
      'Serum',
      'Setting Spray',
      'Facial Wash',
      'Lippies'
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Menampilkan 2 item per baris
            crossAxisSpacing: 10.0, // Spasi antar kolom
            mainAxisSpacing: 10.0, // Spasi antar baris
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: InkWell(
                onTap: () {
                  // Navigasi ke halaman daftar produk sesuai kategori yang dipilih
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DaftarProdukPage(category: categories[index]),
                    ),
                  );
                },
                child: Center(
                  child: Text(
                    categories[index],
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DaftarProdukPage extends StatelessWidget {
  final String category;

  const DaftarProdukPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> products;

    // Menentukan produk berdasarkan kategori
    if (category == 'Moisturizer') {
      products = [
        {
          'name': 'SKINTIFIC - 5X Ceramide Barrier Moisturizer Gel',
          'description': 'Moisturizer yang menggabungkan 3 kandungan aktif Ceramide, Hyaluronic Acid, dan Centella Asiatica, untuk mengatasi permasalahan skin barrier yang rusak seperti jerawat, kemerahan, kulit bertekstur, dan juga kulit kering secara cepat namun tetap aman untuk skin barrier.',
          'price': 'Rp 120.000',
          'image': 'assets/images/product_0.jpg'
        },
        {
          'name': 'GLAD2GLOW Pomegranate Niacinamide Brightening Moisturizer',
          'description': 'Moisturizer dengan kandungan Pomegranate dan  Niacinamide yang dapat mencerahkan sekaligus membantu meratakan warna kulit. Memiliki tekstur ringan yang mudah meresap, dapat digunakan pada pagi dan malam hari. ',
          'price': 'Rp 44.900',
          'image': 'assets/images/moist_2.webp'
        },
        {
          'name': 'ELFORMULA Intensive CeraHydro Barrier Repair Moisture Gel',
          'description': 'Elformula CeraHydro Barrier Moisture Gel merupakan Moisture Gel yang termasuk dalam rangkaian Elformula Skin Barrier Line, yang merupakan line skincare khusus dari Elformula dengan fokus utama: Skin Barrier Treatment dengan ingredients yang terverifikasi aman dan memberikan efek nyata pada kulit.',
          'price': 'Rp 129.000',
          'image': 'assets/images/moist_3.webp'
        },
      ];
    } else if (category == 'Sunscreen') {
      products = [
        {
          'name': 'Skin Aqua Sunscreen UV Whitening MIlk',
          'description': 'SPF 50+ untuk perlindungan 51x lebih lama terhadap sinar UV-B yang menyebabkan kulit terbakar. PA+++ untuk perlindungan terhadap UV-A yang menyebabkan penuaan dini dan kulit menjadi lebih gelap.',
          'price': 'Rp 55.990',
          'image': 'assets/images/sun_1.webp'
        },
        {
          'name': 'Azarine Hydrasoothe Sunscreen Gel SPF45 PA++++',
          'description': 'Tabir surya wajah dalam bentuk gel (water base) yang sangat ringan, dingin dan mudah meresap untuk seluruh jenis kulit termasuk kulit berminyak dan acne prone skin. ',
          'price': 'Rp 55.000',
          'image': 'assets/images/sun_2.webp'
        },
        {
          'name': 'AMATERASUN UV Sunscreen Serum SPF 50+ PA++',
          'description': 'Dilengkapi dengan Intelligent DNA GuardianTM (by AMATERASUN) yang melindungi kerusakan DNA pada kulit dari paparan sinar UVA, UVB, Bluelight, Infrared, polusi dan Radikal bebas. Tekstur super cair, tidak lengket, no white cast, no pilling, dan tidak meninggalkan residu atau stain.',
          'price': 'Rp 65.000',
          'image': 'assets/images/sun_3.webp'
        },
      ];
    } else if (category == 'Toner') {
      products = [
        {
          'name': 'NPURE Toner Cica Acne',
          'description': 'Hydrating toner dengan pH balance yang mengandung Real Centella Leaves, 11x Acne Power Fighter, dan Tranexamic Acid untuk membantu membersihkan wajah dari sisa kotoran, mencerahkan kulit wajah, merawat kulit berjerawat serta membuat kulit terasa segar, lembut, dan lembap.',
          'price': 'Rp 96.000',
          'image': 'assets/images/product_5.jpg'
        },
        {
          'name': 'Pratista - Hyalu Hydrating Toner',
          'description': 'Sodium Hyaluronate merupakan derivat dari Hyaluronic Acid, dengan ukuran molekul yang jauh lebih kecil sehingga lebih mudah terabsorbsi kedalam kulit. Membuat kulit lebih lembab, plumpy, dan smooth.',
          'price': 'Rp 64.900',
          'image': 'assets/images/toner_2.webp'
        },
        {
          'name': 'The Originote Cica-B5 Soothing Essence Toner',
          'description': 'Menenangkan kulit yang berjerawat, iritasi maupun sensitif, membantu menenangkan kemerahan pada wajah, serta menyegarkan kulit dan menghilangkan minyak berlebih.',
          'price': 'Rp 25.000',
          'image': 'assets/images/toner_3.webp'
        },
      ];
    } else if (category == 'Cushion') {
      products = [
        {
          'name': 'Instaperfect Skincover Air Cushion',
          'description': 'Instaperfect Skincover Air Cushion adalah cushion dari Instaperfect dengan formula yang lebih baik dari produk sebelumnya (Mineralight Matte BB Cushion) dan hadir dengan kemasan baru yang lebih cantik. Cushion halal hadir dalam 6 warna dengan Real Skin Buildable Coverage menempel sempurna.',
          'price': 'Rp 120.000',
          'image': 'assets/images/product_2.jpg'
        },
        {
          'name': 'SOMETHINC COPY PASTE Breathable Mesh Cushion SPF 33 PA++',
          'description': 'Copy Paste Cushion / Cusion spesial dari Somethinc yang dilengkapi dengan Breathable Technology & Non-Comedogenic Certified ini diciptakan spesial untuk kulit Indonesia. Ringan, tahan lama & tidak menyumbat pori membuat cushion ini nyaman dipakai di cuaca tropis.',
          'price': 'Rp 139.900',
          'image': 'assets/images/cushion_2.webp'
        },
        {
          'name': 'Wardah Colorfit Perfect Glow Cushion - Medium to High Coverage',
          'description': 'Wardah Colorfit Perfect Glow Cushion merupakan base makeup dengan glow finish dan high coverage yang mampu menutupi noda hitam dan bekas jerawat pada wajah. Dilengkapi dengan Glow-Perfecting Pigment yang memberikan efek glow hingga 12 jam tanpa terkesan berminyak.',
          'price': 'Rp 129.000',
          'image': 'assets/images/cushion_3.webp'
        },
      ];
    } else if (category == 'Serum') {
      products = [
        {
          'name': 'SKIN1004 Madagascar Centella Ampoule',
          'description': 'Ekstrak murni Centella Asiatica Madagascar memberikan perawatan menenangkan yang kuat untuk merawat kulit sensitif dan memperkuat skin barrier dan mempertahankan rasio air-minyak yang seimbang dan memberikan kelembapan yang melimpah.',
          'price': 'Rp 220.000',
          'image': 'assets/images/product_1.jpg'
        },
        {
          'name': 'MSBB - Avoskin Your Skin Bae Lactic Acid 10% + Kiwi Fruit 5% + Niacinamide 2,5% High Dose Serum',
          'description': 'Serum dengan kandungan utama ekstrak kiwi yang memiliki manfaat menunda penuaan pada kulit wajah. Kandungan lainnya mengandung asam laktat dan Niacinamide yang berfungsi untuk mencerahkan dan menstimulasi kolagen pada kulit. ',
          'price': 'Rp 110.970',
          'image': 'assets/images/serum_2.webp'
        },
        {
          'name': 'Garnier Sakura Glow Hyaluron 30x Booster Serum Skin Care',
          'description': 'Serum dengan kandungan formula pelembap tertinggi dari 30X Hyaluron untuk dapatkan newborn glowing skin dalam 7 hari. Diperkaya dengan Ekstrak Sakura Jepang, dipetik dengan tangan dan diproses secara berkelanjutan, dikenal mampu membuat kulit tampak lebih cerah, lembut dan halus.',
          'price': 'Rp 111.000',
          'image': 'assets/images/serum_3.webp'
        },
      ];
    } else if (category == 'Setting Spray') {
      products = [
        {
          'name': 'Studio Tropik DreamSetter Glowy 2.0 Pollution Protection Make-up Setting Spray',
          'description': 'Membantu make-up bertahan lebih lama dan tidak mudah pudar sepanjang hari hingga 16 jam dan mengandung Marrubium Vulgare yang dapat melindungi kulit dari polusi debu, asap, dan partikel kotoran.',
          'price': 'Rp 148.990',
          'image': 'assets/images/product_4.jpg'
        },
        {
          'name': 'Sea Makeup Lock It Matte Acne Setting Spray',
          'description': 'Setting spray yang dilengkapi oleh succinic acid, resveratrol dan bisabolol membuat SEA Makeup Lock it Matte Acne Setting Spray ini merupakan produk makeup yang diformulasikan khusus sebagai makeup yang memiliki fungsi untuk menyembuhkan dan merawat kulit jerawat. ',
          'price': 'Rp 68.000',
          'image': 'assets/images/setting_2.webp'
        },
        {
          'name': 'DAZZLE ME Get a Grip! Makeup Setting Spray Dewy Fix Beauty Protecting',
          'description': 'Dirancang khusus untuk memberikan sentuhan akhir yang dewy dan segar, spray ini berfungsi sebagai pelindung kecantikan sekaligus memberikan kelembapan ekstra bagi kulit.',
          'price': 'Rp 39.900',
          'image': 'assets/images/setting_3.webp'
        },
      ];
    } else if (category == 'Facial Wash') {
      products = [
        {
          'name': 'Wardah Perfect Bright Creamy Foam Bright OiL',
          'description': 'Inovasi Skin Lightening System, kombinasi 2 aktif pencerah, ekstrak licorice dan Vit B3 yang dikenal bantu mencerahkan serta menjaga kelembaban kulit wajah.',
          'price': 'Rp 35.000',
          'image': 'assets/images/product_3.jpg'
        },
        {
          'name': 'COSRX Low pH Good Morning Cleanser',
          'description': 'Pembersih wajah dengan formula lembut, mampu membersihkan kulit sensitif sekalipun dengan lembut berkat kandungannya yang memiliki kadar acid yang mirip dengan kadar pH kulit. Gel cleanser ini mampu menenangkan, mengeksfoliasi, melembapkan sekaligus membersihkan kulit wajah.',
          'price': 'Rp 51.900',
          'image': 'assets/images/fw_2.webp'
        },
        {
          'name': 'SENKA Perfect Whip U Facial Foam From Japan',
          'description': 'Terbaik di Asia bahkan dunia, kini hadir di Indonesia. Terbukti lembut membersihkan dan cocok untuk semua jenis kulit. Facial Foam ini mengandung "White Cocoon Essence" kualitas terbaik untuk menciptakan busa yang lembut, tebal dan melimpah yang mampu membersihkan make-up, kotoran dan minyak berlebih dengan halus.',
          'price': 'Rp 58.000',
          'image': 'assets/images/fw_3.webp'
        },
      ];
    } else {
      products = [
        {
          'name': 'BNB barenbliss Apple Makes Adorable Mousse Tint Lip',
          'description': 'Lip mousse tint dengan Watery Film Technology, Ultra-velvety Powder, dan 8X kandungan kebaikan alami untuk tampilan bibir yang lembut dan segar.',
          'price': 'Rp 63.500',
          'image': 'assets/images/lip_1.webp'
        },
        {
          'name': 'Sea Makeup Hydrating Glossy Gleam Luster Tinted Lip Balm Moisturizing',
          'description': 'Sea Makeup Gleam Luster Tinted Lip Balm adalah tinted lip balm dengan warna yang vibrant dan strong glossy effect dengan kandungan 3X Hyaluronic Acid dan Hydrating Oil Blend yang dapat menghidrasi bibir secara lembut sepanjang hari. ',
          'price': 'Rp 30.900',
          'image': 'assets/images/lip_2.webp'
        },
        {
          'name': 'Maybelline Superstay Vinyl Ink - Liquid Lipstik',
          'description': 'Kini hadir dalam 28+ warna yang tahan lama hingga 16 jam walau dipakai makan namun tetap ringan di bibir karna mengandung Aloe Vera yang melembapkan.',
          'price': 'Rp 118.500',
          'image': 'assets/images/lip_3.webp'
        },
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(' $category'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            elevation: 5,
            child: ListTile(
              leading: Image.network(products[index]['image']!),
              title: Text(products[index]['name']!),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products[index]['description']!),
                  Text(
                    products[index]['price']!,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
              onTap: () {
                // Aksi ketika produk diklik, bisa menambahkan logika untuk detail produk
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(products[index]['name']!),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(products[index]['image']!),
                        Text('Description: ${products[index]['description']}'),
                        Text('Price: ${products[index]['price']}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}