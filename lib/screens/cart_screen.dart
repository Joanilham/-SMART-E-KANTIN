import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product_model.dart';

class CartScreen_Joan extends StatefulWidget {
  final String currentUserNim_Joan;
  const CartScreen_Joan({super.key, required this.currentUserNim_Joan});

  @override
  State<CartScreen_Joan> createState() => _CartScreen_JoanState();
}

class _CartScreen_JoanState extends State<CartScreen_Joan> {
  @override
  void initState() {
    super.initState();
    // Hitung transaksi saat masuk layar keranjang
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CartProvider_Joan>(
        context,
        listen: false,
      ).calculateTransaction_Joan(widget.currentUserNim_Joan);
    });
  }

  int _countQuantity(List<ProductModel_stefano> items, ProductModel_stefano p) {
    return items
        .where((e) => e.productId_stefano == p.productId_stefano)
        .length;
  }

  double _calculateSubtotal(List<ProductModel_stefano> items) {
    double subtotal = 0;
    for (var item in items) {
      subtotal += item.price_stefano.toDouble();
    }
    return subtotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shadowColor: const Color.fromARGB(255, 98, 98, 98),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
        title: const Text(
          "Keranjang Belanja",
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Consumer<CartProvider_Joan>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 64,
                    color: const Color.fromARGB(255, 75, 213, 255),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Keranjang kosong",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          final subtotal = _calculateSubtotal(cart.items);

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cart.items
                      .map((e) => e.productId_stefano)
                      .toSet()
                      .length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    // Get unique products
                    final uniqueIds = cart.items
                        .map((e) => e.productId_stefano)
                        .toSet()
                        .toList();
                    final pid = uniqueIds[index];
                    final product = cart.items.firstWhere(
                      (e) => e.productId_stefano == pid,
                    );
                    final qty = _countQuantity(cart.items, product);

                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.imageUrl_stefano,
                                width: 72,
                                height: 72,
                                fit: BoxFit.cover,
                                errorBuilder: (c, e, st) =>
                                    const Icon(Icons.fastfood, size: 48),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name_stefano,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Rp ${product.price_stefano}',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 43, 205, 255),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                            255,
                                            174,
                                            236,
                                            255,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () => cart
                                                  .removeFromCart_Joan(product),
                                              icon: Icon(
                                                Icons.remove,
                                                color: const Color.fromARGB(
                                                  255,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                              ),
                                              splashRadius: 20,
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                            Text(
                                              qty.toString(),
                                              style: const TextStyle(
                                                color: Color.fromARGB(
                                                  255,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () =>
                                                  cart.addToCart_Joan(product),
                                              icon: Icon(
                                                Icons.add,
                                                color: const Color.fromARGB(
                                                  255,
                                                  0,
                                                  0,
                                                  0,
                                                ),
                                              ),
                                              splashRadius: 20,
                                              visualDensity:
                                                  VisualDensity.compact,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () async {
                                          final confirm = await showDialog<bool>(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text('Konfirmasi'),
                                              content: Text(
                                                'Yakin ingin menghapus "${product.name_stefano}" dari keranjang?',
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.of(
                                                    ctx,
                                                  ).pop(false),
                                                  child: const Text('Batal'),
                                                ),
                                                TextButton(
                                                  onPressed: () => Navigator.of(
                                                    ctx,
                                                  ).pop(true),
                                                  child: const Text(
                                                    'Hapus',
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );

                                          if (confirm == true) {
                                            for (int i = 0; i < qty; i++) {
                                              cart.removeFromCart_Joan(product);
                                            }
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.delete_outline,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Footer summary
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (cart.promoDescription_Joan.isNotEmpty)
                      Text(
                        cart.promoDescription_Joan,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal:'),
                        Text('Rp ${subtotal.toStringAsFixed(0)}'),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Ongkir:'),
                        Text('Rp ${cart.shippingCost_Joan.toStringAsFixed(0)}'),
                      ],
                    ),
                    const Divider(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Bayar:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Rp ${(cart.finalPrice_Joan == 0 ? subtotal : cart.finalPrice_Joan).toStringAsFixed(0)}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 43, 205, 255),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.payment,
                          size: 20,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Checkout Sekarang',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            75,
                            213,
                            255,
                          ),
                          foregroundColor: Colors.white,
                          elevation: 8,
                          shadowColor: Color.fromARGB(
                            255,
                            75,
                            213,
                            255,
                          ).withOpacity(0.35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                        ),
                        onPressed: () async {
                          // show in-button loading could be added; keep existing modal loader
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          bool success = await cart.processCheckout_Joan();
                          if (context.mounted) Navigator.pop(context);
                          if (success) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout Berhasil!'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pop(context);
                            }
                          } else {
                            if (context.mounted)
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout Gagal! Coba lagi.'),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.red,
                                ),
                              );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
