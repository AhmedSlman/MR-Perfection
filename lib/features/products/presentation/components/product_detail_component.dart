import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/entities/product.dart';
import '../widgets/product_image.dart';
import '../widgets/product_info.dart';
import '../widgets/product_rating.dart';

class ProductDetailComponent extends StatelessWidget {
  final Product product;

  const ProductDetailComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '\$');

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(imageUrl: product.image),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductInfo(
                  title: product.title,
                  price: currencyFormat.format(product.price),
                  category: product.category,
                  description: product.description,
                ),
                const SizedBox(height: 16),
                ProductRating(
                  rating: product.rating,
                  ratingCount: product.ratingCount,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 