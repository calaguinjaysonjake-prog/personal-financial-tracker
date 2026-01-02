import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/transaction.dart';

class ApiService {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS Simulator, Web or Windows
  static String get baseUrl {
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      return 'http://localhost:5000/api/transactions';
    }
    return 'http://10.0.2.2:5000/api/transactions';
  }

  Future<List<Transaction>> getTransactions({String? category}) async {
    String url = baseUrl;
    if (category != null && category.isNotEmpty) {
      url += '?category=$category';
    }

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        final List<dynamic> data = body['data'];
        return data.map((json) => Transaction.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<Transaction> addTransaction(Transaction transaction) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaction.toJson()),
      );

      if (response.statusCode == 201) {
        final Map<String, dynamic> body = json.decode(response.body);
        return Transaction.fromJson(body['data']);
      } else {
        throw Exception('Failed to add transaction');
      }
    } catch (e) {
      throw Exception('Failed to add transaction: $e');
    }
  }

  Future<Transaction> updateTransaction(String id, Transaction transaction) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(transaction.toJson()),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = json.decode(response.body);
        return Transaction.fromJson(body['data']);
      } else {
        throw Exception('Failed to update transaction');
      }
    } catch (e) {
      throw Exception('Failed to update transaction: $e');
    }
  }

  Future<void> deleteTransaction(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));

      if (response.statusCode != 200) {
        throw Exception('Failed to delete transaction');
      }
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }
}
