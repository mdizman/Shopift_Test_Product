import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hollypalm_case_app/core/themes/theme.dart';
import 'package:hollypalm_case_app/modules/view/product_detail_view.dart';


void main() async{
  await dotenv.load(fileName: ".env");

  runApp(const ProviderScope(child: MyApp()));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ürün Detay',
      theme: AppTheme.light,
      home: const ProductDetailView(),
    );
  }
}