import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class HomeScreen_DEV extends StatelessWidget {
  // Asumsi User NIM didapat setelah login
  final String currentUserNim_DEV; 

  const HomeScreen_DEV({super.key, required this.currentUserNim_DEV});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu Kantin"),
        actions: [
          // Icon Keranjang dengan Badge Jumlah Item
          Consumer<CartProvider_DEV>(
            builder: (context, cart, child) {
              return IconButton(
                icon: Badge(
                  label: Text(cart.items.length.toString()),
                  child: const Icon(Icons.shopping_cart),
                ),
                onPressed: () {
                  // Hitung total sebelum masuk halaman cart
                  cart.calculateTransaction_DEV(currentUserNim_DEV);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen_DEV()),
                  );
                },
              );
            },
          )
        ],
      ),
      // StreamBuilder untuk Realtime Update dari Firebase [cite: 12]
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          // 1. Handling Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator()); // Widget Loading [cite: 45]
          }

          // 2. Handling Error / Kosong 
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("Menu sedang kosong, silakan kembali nanti."));
          }

          // 3. Render Data
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              
              // Konversi JSON ke Model (Tugas Anggota 1)
              ProductModel_DEV product = ProductModel_DEV.fromJson(data);

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(product.imageUrl_DEV, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(product.name_DEV),
                  subtitle: Text("Rp ${product.price_DEV}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    onPressed: () {
                      // Panggil Logic Add to Cart (Anggota 4) [cite: 39]
                      Provider.of<CartProvider_DEV>(context, listen: false).addToCart_DEV(product);
                      
                      // Feedback ke User (UX Matang)
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${product.name_DEV} masuk keranjang!")),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}