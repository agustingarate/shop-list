import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/Logic/cart_provider.dart';

import '../models/category.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class CategoriesProductsPageArguments {
  final Category category;
  final List<Product> products;

  CategoriesProductsPageArguments({
    required this.category,
    required this.products,
  });
}
class CategoriesProductsPage extends StatefulWidget {
  const CategoriesProductsPage({super.key});

  @override
  State<CategoriesProductsPage> createState() => _CategoriesProductsPageState();
}

class _CategoriesProductsPageState extends State<CategoriesProductsPage> {
  List<Product> filteredProducts = [];

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as CategoriesProductsPageArguments;
    filteredProducts.addAll(arguments.products);
    filteredProducts.retainWhere((element){
      return element.category.id == arguments.category.id;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.category.title),
      ),
      body: Builder(builder: (BuildContext context) { 
        if(filteredProducts.isNotEmpty){
          return GridView.count(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 0.73,
            children: List.generate(
              filteredProducts.length,
                  (i) {
                return ProductCard(product: filteredProducts[i]);
              },
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      ),
    );
  }
}
