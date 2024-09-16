import 'package:flutter/material.dart';

class ProductCatalogPage extends StatefulWidget {
  @override
  _ProductCatalogPageState createState() => _ProductCatalogPageState();
}

class _ProductCatalogPageState extends State<ProductCatalogPage> {
  List<Product> _products = [
    Product(
      id: 1,
      name: 'Product 1',
      description: 'This is product 1',
      price: 19.99,
      image: 'https://picsum.photos/200/300',
    ),
    Product(
      id: 2,
      name: 'Product 2',
      description: 'This is product 2',
      price: 9.99,
      image: 'https://picsum.photos/200/301',
    ),
    Product(
      id: 3,
      name: 'Product 3',
      description: 'This is product 3',
      price: 29.99,
      image: 'https://picsum.photos/200/302',
    ),
    // Add more products here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: _products[index],
          );
        },
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String image;

  Product(
      {required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.image});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          // Image.network(
          //   product.image,
          //   fit: BoxFit.cover,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.description,
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${product.price}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
