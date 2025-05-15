import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../core/graphql/graphql_config.dart';
import '../model/product_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductService {

  static Future<ProductModel> fetchProducts() async {                    //Shopift query
    const String query = r'''
  query GetProduct($id: ID!) {
    product(id: $id) {
      availableForSale
      createdAt
      description
      descriptionHtml
      encodedVariantAvailability
      encodedVariantExistence
      handle
      id
      isGiftCard
      onlineStoreUrl
      productType
      publishedAt
      requiresSellingPlan
      title
      totalInventory
      trackingParameters
      updatedAt
      vendor
      images(first: 3) {
        nodes {
          altText
          height
          id
          originalSrc
          src
          transformedSrc
          url
          width
        }
      }
      priceRange {
        maxVariantPrice {
          amount
          currencyCode
        }
      }
      collections(first: 3) {
        edges {
          node {
            description
            descriptionHtml
            handle
            id
            onlineStoreUrl
            title
            trackingParameters
            updatedAt
          }
        }
      }
    }
  }
''';

    
  final result = await GraphQLConfig.client.query(
    QueryOptions(document: gql(query),variables: {
      "id":dotenv.env['PRODUCT_ID']
    }),
  );

  if (result.hasException) {
    throw Exception(result.exception.toString());
  }

  final json = result.data?['product'];
  return ProductModel.fromJson(json);
  }
}



