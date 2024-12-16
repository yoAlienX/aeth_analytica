import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Q4_e_commerce_app(),
    debugShowCheckedModeBanner: false,
  ));
}

class Q4_e_commerce_app extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Book', 'description': '\$ 12'},
    {'name': 'Car', 'description': '\$ 15034'},
    {'name': 'Jwellery', 'description': '\$ 374'},
    {'name': 'Light', 'description': '\$ 8.23'},
    {'name': 'Sweets', 'description': '\$ 2.99'},
    {'name': 'Laptop', 'description': '\$ 4499.99'},
    {'name': 'Printer', 'description': '\$ 12'},
    {'name': 'Dandadan Manga', 'description': '\$ 23.59'},
    {'name': 'Mobile Phone', 'description': '\$ 239'},
    {'name': 'Router', 'description': '\$ 74.29'},
    {'name': 'Bat', 'description': '\$ 26.99'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products List',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              products[index]['name']!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black87),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailsPage(product: products[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        product['name']!,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
      )),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          spacing: 10,
          children: [
            Center(
              child: Text(
                product['name']!,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black87),
              ),
            ),
            Text(
              product['description']!,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                  fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
