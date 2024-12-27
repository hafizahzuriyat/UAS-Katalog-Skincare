import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://localhost/flutter_crud_api/api.php'; // Ganti sesuai URL backend Anda

  // GET: Fetch all barang
  Future<List<dynamic>> getAllBarang() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List) {
          return data;
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching barang: $e');
    }
  }

  // POST: Add new barang
  Future<String> addBarang(Map<String, dynamic> barang) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(barang),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['message'] != null) {
          return data['message'];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to add barang: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error adding barang: $e');
    }
  }

  // PUT: Update existing barang
  Future<String> updateBarang(Map<String, dynamic> barang) async {
    try {
      final response = await http.put(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(barang),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['message'] != null) {
          return data['message'];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to update barang: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating barang: $e');
    }
  }

  // DELETE: Delete a barang
  Future<String> deleteBarang(int id) async {
    try {
      final response = await http.delete(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': id}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['message'] != null) {
          return data['message'];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Failed to delete barang: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting barang: $e');
    }
  }
}