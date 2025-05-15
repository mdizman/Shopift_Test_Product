import 'package:flutter/material.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';

class BottomBar extends StatelessWidget {
  final String priceText;
  final VoidCallback onAddToCart;

  const BottomBar({
    super.key,
    required this.priceText,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: AppConstants.primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              priceText,
              style: const TextStyle(fontSize: 20, color: AppConstants.black,fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                onPressed: onAddToCart,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text(
                  "Sepete Ekle",
                  style: TextStyle(fontSize: 16, color: AppConstants.textColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
