import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hollypalm_case_app/core/constants/constants.dart';
import 'package:hollypalm_case_app/shared/accordion.dart';
import 'package:hollypalm_case_app/shared/custom_snacbar.dart';
import 'package:hollypalm_case_app/shared/detail.dart';
import 'package:hollypalm_case_app/shared/favorite_button.dart';
import 'package:hollypalm_case_app/shared/header.dart';
import 'package:hollypalm_case_app/shared/select_image.dart';
import '../../../core/utils/html_parser.dart';
import '../../shared/bottom_bar.dart';
import '../provider/product_provider.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider);                                         // State management Riverpod kullanımı 
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: productAsync.when(
        data: (product) {
          return CustomScrollView(
            slivers: [
              ProductHeader(screenHeight: screenHeight, product: product,),     //Ürün resimlerinin slider penceresi
              SliverToBoxAdapter(
                child: Container(
                  color: AppConstants.textColor,
                  width: screenWidth,
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                product.title ?? "",                                 //Ürün Bilgileri
                                style: const TextStyle(fontSize: 22),
                              ),
                            ),
                            const FavoriteButton(),
                          ],
                        ),
                        SelectImageWidget(product: product),
                        const SizedBox(height: 25),
                        const DetailWidget(icon: Icons.local_shipping_outlined, data: "22-25 Ağustos Kargoda"),
                        const SizedBox(height: 10),
                        const DetailWidget(icon: Icons.assignment_return, data: "14 Gün Koşulsuz İade"),
                        const SizedBox(height: 25),
                        const Divider(thickness: 1, height: 0.5),
                        CustomAccordion(
                          title: "Ürün Bilgileri",
                          child: HtmlParser.render(product.descriptionHtml ?? ""),     // Ürün açıklaması Html PArser edildiği kısım 
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(
                          title: "Taksit Seçenekleri",
                          child: Text("Bu ürün için Taksit seçeneği bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(
                          title: "İade, İptal ve Teslimat Koşulları",
                          child: Text("Bu ürün için İade, iptal ve teslimat koşulu bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 1),
                        const CustomAccordion(                                         // Ürün bilgilerinin akordiyon olarak açılıp kapatıldığı widget
                          title: "Paylaş",
                          child: Text("Paylaş için bir seçenek bulunmamakta."),
                        ),
                        const Divider(thickness: 1, height: 0.5),
                        // SizedBox(height: screenHeight * 0.1),
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
      bottomNavigationBar: productAsync.when(       //Floating scroll
        data: (product) => BottomBar(
          priceText: "${product.maxVariantPriceAmount ?? ""} ${product.currencyCode ?? ""}",
          onAddToCart: () {
            showCustomSnackbar(context, "Sepetinize başarıyla eklendi");                                // Sepete eklenildiğinde açılan snackbar bilgilendirme kutusu
          },
        ),
        loading: () => const SizedBox.shrink(),
        error: (err, stack) => const SizedBox.shrink(),
      ),
    );
  }
}

