import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class CartProvider_Joan extends ChangeNotifier {
  final List<ProductModel_stefano> _items_Joan = [];
  List<ProductModel_stefano> get items => _items_Joan;

  double _finalPrice_Joan = 0;
  String _promoDescription_Joan = "";
  double _shippingCost_Joan = 0;

  double get finalPrice_Joan => _finalPrice_Joan;
  String get promoDescription_Joan => _promoDescription_Joan;
  double get shippingCost_Joan => _shippingCost_Joan;

  String _savedNim = "";

  void addToCart_Joan(ProductModel_stefano product) {
    _items_Joan.add(product);
    if (_savedNim.isNotEmpty) {
      calculateTransaction_Joan(_savedNim);
    }
    notifyListeners();
  }

  void removeFromCart_Joan(ProductModel_stefano product) {
    _items_Joan.remove(product);
    if (_savedNim.isNotEmpty) {
      calculateTransaction_Joan(_savedNim);
    }
    notifyListeners();
  }

  void calculateTransaction_Joan(String userNim) {
    _savedNim = userNim; // Simpan NIM untuk kalkulasi ulang otomatis

    double subtotal = 0;
    for (var item in _items_Joan) {
      subtotal += item.price_stefano.toDouble();
    }

    if (userNim.isEmpty) return;

    int? lastDigit;
    try {
      lastDigit = int.parse(userNim.substring(userNim.length - 1));
    } catch (e) {
      // Jika NIM bukan angka (misal nama), anggap sebagai NIM Genap (Standard)
      lastDigit = 0;
    }

    if (lastDigit != null && lastDigit % 2 != 0) {
      // NIM Ganjil: Diskon 5% + Ongkir Rp 10.000
      double discount = subtotal * 0.05;
      _shippingCost_Joan = 10000;
      _finalPrice_Joan = (subtotal - discount) + _shippingCost_Joan;
      _promoDescription_Joan =
          "NIM Ganjil: Diskon 5% (-Rp ${discount.toStringAsFixed(0)}) + Ongkir Rp 10.000";
    } else {
      // NIM Genap: Gratis Ongkir + Harga Normal
      _shippingCost_Joan = 0;
      _finalPrice_Joan = subtotal;
      _promoDescription_Joan = "NIM Genap: Gratis Ongkir!";
    }
    notifyListeners();
  }

  Future<bool> processCheckout_Joan() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final batch = firestore.batch();

      // Kelompokkan item berdasarkan ID untuk menghitung jumlah pengurangan per produk
      Map<String, int> productQuantities = {};
      for (var item in _items_Joan) {
        productQuantities[item.productId_stefano] =
            (productQuantities[item.productId_stefano] ?? 0) + 1;
      }

      // Loop setiap produk unik dan kurangi stoknya
      for (var entry in productQuantities.entries) {
        String productId = entry.key;
        int quantityToBuy = entry.value;

        DocumentReference productRef = firestore
            .collection('products')
            .doc(productId);

        // Note: Idealnya pakai Transaction untuk safety concurrency,
        // tapi Batch cukup untuk use case sederhana ini.
        // Kita gunakan FieldValue.increment(-quantity)
        batch.update(productRef, {
          'stock': FieldValue.increment(-quantityToBuy),
        });
      }

      await batch.commit();
      clearCart_Joan(); // Kosongkan keranjang setelah sukses
      return true;
    } catch (e) {
      print("Error Checkout: $e");
      return false;
    }
  }

  void clearCart_Joan() {
    _items_Joan.clear();
    _finalPrice_Joan = 0;
    _shippingCost_Joan = 0;
    _promoDescription_Joan = "";
    notifyListeners();
  }
}
