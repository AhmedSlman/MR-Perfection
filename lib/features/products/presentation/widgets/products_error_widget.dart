import 'package:flutter/material.dart';
import 'package:product_listing_app/core/utils/app_strings.dart';

class ProductsErrorWidget extends StatelessWidget {
  const ProductsErrorWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          Text(text),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text(AppStrings.tryAgain),
          ),
        ],
      ),
    );
  }
}
