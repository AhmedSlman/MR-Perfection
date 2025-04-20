import 'package:flutter/material.dart';
import '../components/product_list_component.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: const ProductListComponent(),
    );
  }
} 