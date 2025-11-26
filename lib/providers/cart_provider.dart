import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider_DEV extends ChangeNotifier {
  final List<ProductModel_DEV> _items_DEV = [];
  List<ProductModel_DEV> get items => _items_DEV;
  double _finalPrice_DEV = 0;
  String _promoDescription_DEV = "";
  double _shippingCost_DEV = 0;

  double get finalPrice => _finalPrice_DEV;
  String get promoDescription => _promoDescription_DEV;
  double get shippingCost => _shippingCost_DEV;

  void addToCart_DEV(ProductModel_DEV product) {
    _items_DEV.add(product);
    notifyListeners();
  }
  void removeFromCart_DEV(ProductModel_DEV product) {
    _items_DEV.remove(product);
    notifyListeners();
  }
  void calculateTransaction_DEV(String userNim) {
    double subtotal = 0;
    for (var item in _items_DEV) {
      subtotal += item.price_DEV.toDouble();
    }
    if (userNim.isEmpty) return;
    int lastDigit = int.parse(userNim.substring(userNim.length - 1));
    if (lastDigit % 2 != 0) {
      double discount = subtotal * 0.05;
      _shippingCost_DEV = 15000;
      _finalPrice_DEV = (subtotal - discount) + _shippingCost_DEV;
      _promoDescription_DEV = "NIM Ganjil: Diskon 5% (-Rp ${discount.toStringAsFixed(0)})";
    } else {
      _shippingCost_DEV = 0;
      _finalPrice_DEV = subtotal;
      _promoDescription_DEV = "NIM Genap: Gratis Ongkir (Hemat Rp 15.000)";
    }
    notifyListeners();
  }
  void clearCart_DEV() {
    _items_DEV.clear();
    _finalPrice_DEV = 0;
    notifyListeners();
  }
}