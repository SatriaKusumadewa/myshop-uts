import 'package:flutter/material.dart';

void main() {
  runApp(const MyShopMini());
}

class MyShopMini extends StatelessWidget {
  const MyShopMini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShop Mini',
      home: const HomeScreen(),
    );
  }
}

/// ================================
/// HOME SCREEN
/// ================================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {"label": "Makanan", "icon": Icons.fastfood},
    {"label": "Minuman", "icon": Icons.local_drink},
    {"label": "Elektronik", "icon": Icons.electrical_services},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyShop Mini")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Pilih Kategori",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categories.map((cat) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ProductListScreen(category: cat["label"]),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Icon(cat["icon"], size: 40),
                        const SizedBox(height: 8),
                        Text(cat["label"]),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

/// ================================
/// PRODUCT LIST SCREEN
/// ================================
class ProductListScreen extends StatelessWidget {
  final String category;
  const ProductListScreen({super.key, required this.category});

  List<Map<String, dynamic>> getProducts() {
  if (category == "Makanan") {
    return [
      {
        "name": "Burger",
        "price": "25.000",
        "icon": Icons.lunch_dining,
        "image": "assets/images/burger.png"
      },
      {
        "name": "Nasi Goreng",
        "price": "15.000",
        "icon": Icons.rice_bowl,
        "image": "assets/images/nasigoreng.png"
      },
      {
        "name": "Mie Goreng",
        "price": "15.000",
        "icon": Icons.rice_bowl,
        "image": "assets/images/miegoreng.png"
      },
      {
        "name": "Ayam Geprek",
        "price": "20.000",
        "icon": Icons.rice_bowl,
        "image": "assets/images/geprek.png"
      },
    ];
  } else if (category == "Minuman") {
    return [
      {
        "name": "Es Teh",
        "price": "5.000",
        "icon": Icons.icecream,
        "image": "assets/images/esteh.png"
      },
      {
        "name": "Kopi",
        "price": "10.000",
        "icon": Icons.coffee,
        "image": "assets/images/kopi.png"
      },
      {
        "name": "Es Jeruk",
        "price": "5.000",
        "icon": Icons.coffee,
        "image": "assets/images/esjeruk.png"
      },
      {
        "name": "Air Mineral",
        "price": "5.000",
        "icon": Icons.coffee,
        "image": "assets/images/airmineral.png"
      },
      
    ];
  } else if (category == "Elektronik") {
    return [
      {
        "name": "Laptop",
        "price": "8.000.000",
        "icon": Icons.laptop,
        "image": "assets/images/laptop.png"
      },
      {
        "name": "Headphone",
        "price": "150.000",
        "icon": Icons.headphones,
        "image": "assets/images/headphone.png"
      },
      {
        "name": "Handphone",
        "price": "3.500.000",
        "icon": Icons.headphones,
        "image": "assets/images/handphone.png"
      },
      {
        "name": "Smart TV",
        "price": "4.000.000",
        "icon": Icons.headphones,
        "image": "assets/images/smarttv.png"
      },
    ];
  }

  return [];
}


  @override
  Widget build(BuildContext context) {
    final products = getProducts();

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "Daftar Produk",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: products.map((product) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                        product["image"],
                        height: 70,
                        fit: BoxFit.contain,
                      ),
                        const SizedBox(height: 10),
                        Text(product["name"]),
                        Text("Rp ${product["price"]}"),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}

/// ================================
/// PRODUCT DETAIL SCREEN
/// ================================
class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product["name"])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              product["image"],
              height: 150,
              fit: BoxFit.contain,
            ),

            Text(
              product["name"],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Rp ${product["price"]}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
