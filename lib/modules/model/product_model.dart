import 'package:hollypalm_case_app/modules/model/collection.dart';

class ProductModel {
  final String? id;
  final String? title;
  final String? handle;
  final String? description;
  final String? descriptionHtml;
  final String? productType;
  final String? vendor;
  final String? onlineStoreUrl;
  final String? createdAt;
  final String? updatedAt;
  final String? publishedAt;
  final String? trackingParameters;
  final bool? availableForSale;
  final bool? isGiftCard;
  final bool? requiresSellingPlan;
  final String? encodedVariantAvailability;
  final String? encodedVariantExistence;
  final int? totalInventory;

  final String? maxVariantPriceAmount;

  final String? currencyCode;

  final List<String> imageUrls;
  final List<String> imageName;


  final List<CollectionModel> collections;

  ProductModel({
    required this.id,
    required this.title,
    required this.handle,
    required this.description,
    required this.descriptionHtml,
    required this.productType,
    required this.vendor,
    required this.onlineStoreUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.trackingParameters,
    required this.availableForSale,
    required this.isGiftCard,
    required this.requiresSellingPlan,
    required this.encodedVariantAvailability,
    required this.encodedVariantExistence,
    required this.totalInventory,
    required this.maxVariantPriceAmount,
    required this.currencyCode,
    required this.imageUrls,
    required this.imageName,

    required this.collections,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final imagesJson = json['images']?['nodes'] as List<dynamic>? ?? [];
    final collectionsJson = json['collections']?['edges'] as List<dynamic>? ?? [];

    return ProductModel(
      id: json['id'],
      title: json['title'],
      handle: json['handle'],
      description: json['description'],
      descriptionHtml: json['descriptionHtml'],
      productType: json['productType'],
      vendor: json['vendor'],
      onlineStoreUrl: json['onlineStoreUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
      trackingParameters: json['trackingParameters'],
      availableForSale: json['availableForSale'],
      isGiftCard: json['isGiftCard'],
      requiresSellingPlan: json['requiresSellingPlan'],
      encodedVariantAvailability: json['encodedVariantAvailability'],
      encodedVariantExistence: json['encodedVariantExistence'],
      totalInventory: json['totalInventory'],
      maxVariantPriceAmount: json['priceRange']?['maxVariantPrice']?['amount'],

      currencyCode: json['priceRange']?['maxVariantPrice']?['currencyCode'],
      imageUrls: imagesJson
          .map((e) => e['originalSrc'] as String? ?? '')
          .where((url) => url.isNotEmpty)
          .toList(),
      imageName: imagesJson
          .map((e) => e['altText'] as String? ?? '')
          .where((url) => url.isNotEmpty)
          .toList(),
      collections: collectionsJson
          .map((e) => CollectionModel.fromJson(e['node']))
          .toList(),
    );
  }
}
