import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirebaseService_Stefano {
  final FirebaseFirestore _firestore_stefano = FirebaseFirestore.instance;

  Future<void> seedProducts_Stefano() async {
    CollectionReference productsRef = _firestore_stefano.collection('products');

    List<ProductModel_stefano> dummyProducts = [
      ProductModel_stefano(
        productId_stefano: 'p1',
        name_stefano: 'Nasi Goreng Spesial',
        price_stefano: 15000,
        stock_stefano: 20,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p2',
        name_stefano: 'Ayam Bakar Madu',
        price_stefano: 20000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p3',
        name_stefano: 'Es Teh Manis',
        price_stefano: 5000,
        stock_stefano: 50,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p4',
        name_stefano: 'Mie Goreng Jawa',
        price_stefano: 12000,
        stock_stefano: 25,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p5',
        name_stefano: 'Soto Ayam',
        price_stefano: 18000,
        stock_stefano: 10,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p6',
        name_stefano: 'Jus Jeruk',
        price_stefano: 8000,
        stock_stefano: 30,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p7',
        name_stefano: 'Bakso Urat',
        price_stefano: 15000,
        stock_stefano: 20,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p8',
        name_stefano: 'Mie Ayam',
        price_stefano: 12000,
        stock_stefano: 20,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p9',
        name_stefano: 'Kopi Hitam',
        price_stefano: 5000,
        stock_stefano: 40,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
      ProductModel_stefano(
        productId_stefano: 'p10',
        name_stefano: 'Roti Bakar',
        price_stefano: 10000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://via.placeholder.com/150',
      ),
    ];

    for (var product in dummyProducts) {
      // Gunakan set dengan merge agar tidak duplikat jika dijalankan ulang
      await productsRef
          .doc(product.productId_stefano)
          .set(product.toJson(), SetOptions(merge: true));
    }
    print("Seeding Data Selesai!");
  }
}
