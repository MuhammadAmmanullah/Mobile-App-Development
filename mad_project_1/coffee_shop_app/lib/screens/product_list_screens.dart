import 'package:flutter/material.dart';
import '../cart.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  final String category;

  ProductListScreen({required this.category});

  final List<Map<String, dynamic>> products = [
    {"name": "Latte", "price": 350, "image": "assets/products/latte.jpg"},
    {
      "name": "Cappuccino",
      "price": 300,
      "image": "assets/products/cappuccino.jpg",
    },
    {"name": "Espresso", "price": 250, "image": "assets/products/espresso.jpg"},
    {
      "name": "Cold Brew",
      "price": 400,
      "image": "assets/products/coldbrew.jpg",
    },
    {"name": "Cookie", "price": 150, "image": "assets/products/cookie.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.3,
          ),
        ),
        backgroundColor: Color(0xFF6F4E37),
        elevation: 2,
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFFAFAFA),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            var item = products[index];

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 16),

                    // Product Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF3E2723),
                              letterSpacing: 0.2,
                            ),
                          ),

                          SizedBox(height: 6),

                          Text(
                            "Rs ${item['price']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF6F4E37),
                            ),
                          ),

                          SizedBox(height: 12),

                          // Add to cart button
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF6F4E37),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 8,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            onPressed: () {
                              Cart.addItem(item['name']);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${item['name']} added to cart",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  backgroundColor: Color(0xFF6F4E37),
                                  duration: const Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(
                                    items: products
                                        .where(
                                          (p) => Cart.items.contains(p['name']),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.add_shopping_cart, size: 18),
                            label: const Text("Add"),
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
    );
  }
}
