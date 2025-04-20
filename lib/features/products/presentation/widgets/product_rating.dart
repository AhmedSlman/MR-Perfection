import 'package:flutter/material.dart';
import 'package:product_listing_app/core/utils/app_strings.dart';

class ProductRating extends StatelessWidget {
  final double rating;
  final int ratingCount;

  const ProductRating({
    super.key,
    required this.rating,
    required this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 8),
        Text(
          '($ratingCount ${AppStrings.reviews})',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
