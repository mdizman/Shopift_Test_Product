import 'package:flutter/material.dart';
import 'package:hollypalm_case_app/modules/model/product_model.dart';

class SelectImageWidget extends StatelessWidget {
  final ProductModel product;
  const SelectImageWidget({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: NetworkImage(product.imageUrls.first),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            product.imageName.first,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}
