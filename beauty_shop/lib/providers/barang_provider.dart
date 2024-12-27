import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/barang.dart';

class BarangProvider with ChangeNotifier {
  List<Items> _barangList = [];
  bool _isLoading = false;

  List<Items> get barangList => _barangList;
  bool get isLoading => _isLoading;

  final String _baseUrl = 'http://localhost/flutter_crud_api/api.php'; // Sesuaikan URL API

  /// Fetch barang data from API
  Future<void> fetchBarang() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _barangList = data.map((item) => Items.fromJson(item)).toList();
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching barang: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Add new barang
  Future<bool> addBarang({
    required String nama,
    required String deskripsi,
    required int harga,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'nama': nama,
          'deskripsi': deskripsi,
          'harga': harga,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == "Item created") {
          await fetchBarang(); // Refresh data barang setelah berhasil menambah barang
          return true;
        }
      }
      print('Failed to add barang: ${response.body}');
      return false;
    } catch (error) {
      print('Error adding barang: $error');
      return false;
    }
  }

  /// Edit barang data
  Future<bool> editBarang({
    required String id,
    required String nama,
    required String deskripsi,
    required int harga,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'id': id,
          'nama': nama,
          'deskripsi': deskripsi,
          'harga': harga,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == "Item updated") {
          await fetchBarang(); // Refresh data barang setelah berhasil mengedit
          return true;
        }
      }
      print('Failed to edit barang: ${response.body}');
      return false;
    } catch (error) {
      print('Error editing barang: $error');
      return false;
    }
  }

  /// Delete barang
  Future<bool> deleteBarang(String id) async {
    try {
      final response = await http.delete(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'id': id}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['message'] == "Item deleted") {
          await fetchBarang(); // Refresh data barang setelah berhasil menghapus
          return true;
        }
      }
      print('Failed to delete barang: ${response.body}');
      return false;
    } catch (error) {
      print('Error deleting barang: $error');
      return false;
    }
  }
}