import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'home_screen.dart';

class ReceiptScreen extends StatelessWidget {
  final List<ProductModel_stefano> items;
  final double subtotal;
  final double shippingCost;
  final double finalPrice;
  final String promoDescription;
  final DateTime transactionDate;
  final String userNim;

  const ReceiptScreen({
    super.key,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.finalPrice,
    required this.promoDescription,
    required this.transactionDate,
    required this.userNim,
  });

  @override
  Widget build(BuildContext context) {
    // Group items for display
    Map<String, int> productQuantities = {};
    for (var item in items) {
      productQuantities[item.productId_stefano] =
          (productQuantities[item.productId_stefano] ?? 0) + 1;
    }
    final uniqueItems = items.toSet().toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Struk Pembayaran"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 64),
                  const SizedBox(height: 12),
                  const Text(
                    "Pembayaran Berhasil!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${transactionDate.day}/${transactionDate.month}/${transactionDate.year} ${transactionDate.hour}:${transactionDate.minute}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Divider(height: 32),
                  // Item List
                  ...uniqueItems.map((item) {
                    int qty = productQuantities[item.productId_stefano] ?? 0;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "${item.name_stefano} x$qty",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          Text(
                            "Rp ${(item.price_stefano * qty).toStringAsFixed(0)}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Divider(height: 32),
                  // Summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Subtotal"),
                      Text("Rp ${subtotal.toStringAsFixed(0)}"),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Ongkir"),
                      Text("Rp ${shippingCost.toStringAsFixed(0)}"),
                    ],
                  ),
                  if (promoDescription.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      promoDescription,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  const Divider(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rp ${finalPrice.toStringAsFixed(0)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen_Bagas(currentUserNim_Bagas: userNim),
                  ),
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 75, 213, 255),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                "Kembali ke Menu Utama",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}