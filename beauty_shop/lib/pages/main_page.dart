import 'package:flutter/material.dart';
import 'barang_page.dart';
import 'kategori_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPageIndex = 0;

  // List of pages corresponding to each drawer item
  final List<Widget> _pages = [
    BarangPage(),
    KategoriPage(),
  ];

  // Titles for each page
  final List<String> _pageTitles = [
    'Data Barang',
    'Kategori Produk',
  ];

  // Function to handle navigation
  void _navigateToPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop(); // Close the drawer after navigation
  }

  // Helper function to create the drawer items
  ListTile _buildDrawerItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => _navigateToPage(index),
      selected: _selectedPageIndex == index, // Highlight selected item
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_selectedPageIndex]), // Update title based on selected page
      ),
      body: _pages[_selectedPageIndex], // Display the current page
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 252, 110, 157)),
              child: Center(
                child: Text(
                  'Menu Navigasi',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            // Add menu items for each page
            _buildDrawerItem('Data Barang', Icons.inventory, 0),
            _buildDrawerItem('Kategori Produk', Icons.category, 1),
          ],
        ),
      ),
    );
  }
}