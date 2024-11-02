import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': 100},
    {'name': 'Product 2', 'price': 200},
    {'name': 'Product 3', 'price': 150},
    {'name': 'Product 4', 'price': 300},
    {'name': 'Product 5', 'price': 250},
  ];

  int? selectedProductIndex;

  void selectProduct(int index) {
    setState(() {
      selectedProductIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: Column(
        children: [          
          Container(
            height: 50, 
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => selectProduct(index),
                  child: Container(
                    width: 70, 
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        products[index]['name'],
                        style: TextStyle(color: Colors.black, fontSize: 10), 
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(6),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
                childAspectRatio: 2 / 2.5,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => selectProduct(index),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index
                          ? Colors.blueAccent.withOpacity(0.3)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: selectedProductIndex == index
                            ? Colors.blueAccent
                            : Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index]['name'],
                          style: TextStyle(
                            fontSize: 12, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black, 
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$${products[index]['price']}',
                          style: TextStyle(fontSize: 10, color: Colors.grey[700]), 
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
