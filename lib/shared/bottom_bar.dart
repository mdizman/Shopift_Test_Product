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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight *0.12,
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
              width: screenWidth *0.4,
              height: screenHeight *0.06,
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
