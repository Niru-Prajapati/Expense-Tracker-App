import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/transaction_model.dart';

class StorageService {
  static const String key = 'transactions';

  static Future<void> saveTransactions(
      List<TransactionModel> transactions) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data = transactions
        .map((transaction) => jsonEncode(transaction.toJson()))
        .toList();
    await prefs.setStringList(key, data);
  }

  static Future<List<TransactionModel>> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();

    List<String>? data = prefs.getStringList(key);

    if (data == null) return [];

    return data
        .map((item) => TransactionModel.fromJson(jsonDecode(item)))
        .toList();
  }
}