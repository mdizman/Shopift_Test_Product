import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';
import 'package:hollypalm_case_app/shared/accordion.dart';
import 'package:hollypalm_case_app/shared/custom_snacbar.dart';
import 'package:hollypalm_case_app/shared/detail.dart';
import 'package:hollypalm_case_app/shared/favorite_button.dart';
import 'package:hollypalm_case_app/shared/select_image.dart';
import '../../../core/utils/html_parser.dart';
import '../../shared/bottom_bar.dart';
import '../provider/product_provider.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: productAsync.when(
        data: (product) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 300,
                backgroundColor: AppConstants.whiteColor,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double percentage = (constraints.maxHeight - kToolbarHeight) / (300 - kToolbarHeight);
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
              ),
              // İçerik bölümü
              SliverToBoxAdapter(
                child: Container(
                  color: AppConstants.textColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.collections[0].title ?? "",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                product.title ?? "",
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                            const FavoriteButton(),
                            
                          ],
                        ),
                        const SizedBox(height: 15),
                        SelectImageWidget(product: product,),
                        const SizedBox(height: 25),
                        const DetailWidget(icon: Icons.local_shipping_outlined, data: "22-25 Ağustos Kargoda"),
                        const SizedBox(height: 10),
                        const DetailWidget(icon: Icons.assignment_return, data: "14 Gün Koşulsuz İade"),
                        const SizedBox(height: 25),
                        const Divider(thickness: 1, height: 0.5),
                        CustomAccordion(
                          title: "Ürün Bilgileri",
                          child: HtmlParser.render(product.descriptionHtml ?? ""),
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(
                          title: "Taksit Seçenekleri",
                          child:  Text("Bu ürün için Taksit seçeneği bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(
                          title: "İade, İptal ve Teslimat Koşulları",
                          child: Text("Bu ürün için İade, iptal ve teslimat koşulu bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(
                          title: "Paylaş",
                          child:  Text("Paylaş için bir seçenek bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 0.5),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Hata: $err")),
      ),
      bottomNavigationBar: productAsync.when(
        data: (product) => BottomBar(
          priceText: "${product.maxVariantPriceAmount ?? ""} ${product.currencyCode ?? ""}",
          onAddToCart: () {
            showCustomSnackbar(context, "Sepetinize başarıyla eklendi");
          },
        ),
        loading: () => const SizedBox.shrink(),
        error: (err, stack) => const SizedBox.shrink(),
      ),
    );
  }
}

