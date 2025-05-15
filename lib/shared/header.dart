import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';
import 'package:hollypalm_case_app/modules/model/product_model.dart';

class ProductHeader extends StatelessWidget {
  const ProductHeader({
    super.key,
    required this.screenHeight,
    required this.product
  });

  final double screenHeight;
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: screenHeight * 0.35,
      backgroundColor: AppConstants.whiteColor,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final double percentage = (constraints.maxHeight - kToolbarHeight) / (screenHeight * 0.35 - kToolbarHeight);
          final double clampedOpacity = percentage.clamp(0.0, 1.0);
          return Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: clampedOpacity,
                child: CarouselSlider.builder(
                  itemCount: product.imageUrls.length,
                  slideBuilder: (index) {
                    return Image.network(
                      product.imageUrls[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                  slideTransform: const CubeTransform(),
                  enableAutoSlider: false,
                  unlimitedMode: true,
                  initialPage: 0,
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.all(32),
                    indicatorBorderColor: AppConstants.whiteBorderColor,
                    indicatorBorderWidth: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
