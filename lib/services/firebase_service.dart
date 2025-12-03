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
        imageUrl_stefano: 'https://dcostseafood.id/wp-content/uploads/2022/04/Nasi-Goreng-ayam-terasi-1.jpg',
      ),
      ProductModel_stefano(
        productId_stefano: 'p2',
        name_stefano: 'Ayam Bakar Madu',
        price_stefano: 20000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWX_hUnSRp3lSJ1Wvxl6J2HxE2qCTlG3ai0Q&s',
      ),
      ProductModel_stefano(
        productId_stefano: 'p3',
        name_stefano: 'Es Teh Manis',
        price_stefano: 5000,
        stock_stefano: 50,
        imageUrl_stefano: 'https://dcostseafood.id/wp-content/uploads/2021/12/Es-teh-tawar-manis.jpg',
      ),
      ProductModel_stefano(
        productId_stefano: 'p4',
        name_stefano: 'Mie Goreng Jawa',
        price_stefano: 12000,
        stock_stefano: 25,
        imageUrl_stefano: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzxV-KoE5BhHzrhPmZ6ROJ7gnjFUQqcwglRg&s',
      ),
      ProductModel_stefano(
        productId_stefano: 'p5',
        name_stefano: 'Soto Ayam',
        price_stefano: 18000,
        stock_stefano: 10,
        imageUrl_stefano: 'https://assets.unileversolutions.com/recipes-v2/242798.jpg',
      ),
      ProductModel_stefano(
        productId_stefano: 'p6',
        name_stefano: 'Jus Jeruk',
        price_stefano: 8000,
        stock_stefano: 30,
        imageUrl_stefano: 'https://res.cloudinary.com/dk0z4ums3/image/upload/v1699924261/attached_image/9-manfaat-jus-jeruk-yang-segarkan-harimu.jpg',
      ),
      ProductModel_stefano(
        productId_stefano: 'p7',
        name_stefano: 'Bakso Urat',
        price_stefano: 15000,
        stock_stefano: 20,
        imageUrl_stefano: 'https://i0.wp.com/resepkoki.id/wp-content/uploads/2016/04/Resep-Bakso-urat.jpg?fit=1518%2C1920&ssl=1',
      ),
      ProductModel_stefano(
        productId_stefano: 'p8',
        name_stefano: 'Mie Ayam',
        price_stefano: 12000,
        stock_stefano: 20,
        imageUrl_stefano: 'https://images.tokopedia.net/img/KRMmCm/2022/8/15/a4b7d013-9438-46b2-906b-4c374ec82236.jpg',
      ),
      ProductModel_stefano(
        productId_stefano: 'p9',
        name_stefano: 'Kopi Hitam',
        price_stefano: 5000,
        stock_stefano: 40,
        imageUrl_stefano: 'https://mu4.co.id/wp-content/uploads/2024/04/kopi-hitam.webp',
      ),
      ProductModel_stefano(
        productId_stefano: 'p10',
        name_stefano: 'Roti Bakar',
        price_stefano: 10000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://assets.pikiran-rakyat.com/crop/0x0:0x0/360x0/webp/photo/2024/11/11/132434077.jpg',
      ),
        ProductModel_stefano(
        productId_stefano: 'p11',
        name_stefano: 'Pizza',
        price_stefano: 10000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTec8zUfRIhICBszXhD7Fv7jAyTKRe7dkAYpQ&s',
      ),
   ProductModel_stefano(
        productId_stefano: 'p12',
        name_stefano: 'Burger',
        price_stefano: 10000,
        stock_stefano: 15,
        imageUrl_stefano: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTec8zUfRIhICBszXhD7Fv7jAyTKRe7dkAYpQ&s',
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