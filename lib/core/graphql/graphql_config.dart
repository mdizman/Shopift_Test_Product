import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static final HttpLink httpLink = HttpLink(
    dotenv.env['STORE_LINK']??"",
    defaultHeaders: {
      'Content-Type': dotenv.env['APPJSON']??"",
      'X-Shopify-Storefront-Access-Token': dotenv.env['APIKEY']??"",
    },
  );

  static final GraphQLClient client = GraphQLClient(
    link: httpLink,
    cache: GraphQLCache(store: InMemoryStore()),
  );
}
