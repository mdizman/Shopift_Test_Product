import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/product_model.dart';
import '../service/product_service.dart';

final productProvider = FutureProvider<ProductModel>((ref) async {
  return await ProductService.fetchProducts();
});