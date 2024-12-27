import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 86, 142),
        title: const Text(
          'Gleam Beauty Shop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Popular Products Section
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: const Text(
                'Popular Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.75,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                final product = productList[index];
                return _buildProductCard(
                  context,
                  product['name'] ?? 'Unknown Product',
                  product['image'] ?? 'assets/images/default_product.png',
                  product['price'] ?? '\$0.00',
                  product['description'] ?? 'No description available',
                );
              },
            ),

            // Add spacing to avoid overflow
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Widget for product card
  Widget _buildProductCard(BuildContext context, String name, String imageUrl, String price, String description) {
    return GestureDetector(
      onTap: () {
        // Navigate to the product details page when clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              name: name,
              imageUrl: imageUrl,
              price: price,
              description: description,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 255, 196, 196).withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(fontSize: 14, color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Example product data
final List<Map<String, String?>> productList = [
  {
    'name': 'SKINTIFIC - 5X Ceramide Barrier Moisturizer Gel',
    'image': 'assets/images/product_0.jpg',
    'price': 'Rp 125.000',
    'description': 'Moisturizer yang menggabungkan 3 kandungan aktif Ceramide, Hyaluronic Acid, dan Centella Asiatica, untuk mengatasi permasalahan skin barrier yang rusak seperti jerawat, kemerahan, kulit bertekstur, dan juga kulit kering secara cepat namun tetap aman untuk skin barrier.',
  },
  {
    'name': 'SKIN1004 Madagascar Centella Ampoule',
    'image': 'assets/images/product_1.jpg',
    'price': 'Rp 220.000',
    'description': 'Ekstrak murni Centella Asiatica Madagascar memberikan perawatan menenangkan yang kuat untuk merawat kulit sensitif dan memperkuat skin barrier dan mempertahankan rasio air-minyak yang seimbang dan memberikan kelembapan yang melimpah.',
  },
  {
    'name': 'Instaperfect Skincover Air Cushion',
    'image': 'assets/images/product_2.jpg',
    'price': 'Rp 120.000',
    'description': 'Instaperfect Skincover Air Cushion adalah cushion dari Instaperfect dengan formula yang lebih baik dari produk sebelumnya (Mineralight Matte BB Cushion) dan hadir dengan kemasan baru yang lebih cantik. Cushion halal hadir dalam 6 warna dengan Real Skin Buildable Coverage menempel sempurna.',
  },
  {
    'name': 'Wardah Perfect Bright Creamy Foam Bright OiL',
    'image': 'assets/images/product_3.jpg',
    'price': 'Rp 35.000',
    'description': 'Inovasi Skin Lightening System, kombinasi 2 aktif pencerah, ekstrak licorice dan Vit B3 yang dikenal bantu mencerahkan serta menjaga kelembaban kulit wajah.',
  },
  {
    'name': 'Studio Tropik DreamSetter Glowy 2.0 Pollution Protection Make-up Setting Spray',
    'image': 'assets/images/product_4.jpg',
    'price': 'Rp 148.990',
    'description': 'Membantu make-up bertahan lebih lama dan tidak mudah pudar sepanjang hari hingga 16 jam dan mengandung Marrubium Vulgare yang dapat melindungi kulit dari polusi debu, asap, dan partikel kotoran.',
  },
  {
    'name': 'NPURE Toner Cica Acne',
    'image': 'assets/images/product_5.jpg',
    'price': 'Rp 96.000',
    'description': 'Hydrating toner dengan pH balance yang mengandung Real Centella Leaves, 11x Acne Power Fighter, dan Tranexamic Acid untuk membantu membersihkan wajah dari sisa kotoran, mencerahkan kulit wajah, merawat kulit berjerawat serta membuat kulit terasa segar, lembut, dan lembap.',
  },
];

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String price;
  final String description;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 86, 142),
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(fontSize: 18, color: Colors.pinkAccent),
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }
}