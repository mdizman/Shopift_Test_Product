import 'package:flutter/material.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';
import 'package:hollypalm_case_app/shared/custom_snacbar.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  int favoriteCount = 1;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      favoriteCount += isFavorite ? 1 : -1;

    });
    _controller.forward(from: 0.8).then((_) => _controller.reverse());

    showCustomSnackbar(
      context,
      isFavorite ? "Favorilere eklendi" : "Favorilerden çıkarıldı",
      backgroundColor: isFavorite ? AppConstants.snacBarGreen : AppConstants.snacBarGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _controller,
      child: IconButton(
        icon: Column(
          children: [
            Icon(
              size:30,
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: AppConstants.black,
            ),
            Text(
          '$favoriteCount',
          style: const TextStyle(fontSize: 18),
        ),
          ],
        ),
        onPressed: toggleFavorite,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
