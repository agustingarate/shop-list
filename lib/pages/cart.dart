import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/Logic/category_provider.dart';
import 'package:shop_list/Logic/product_provider.dart';
import '../Logic/cart_provider.dart';

import '../widgets/categories_list.dart';
import '../widgets/product_card.dart';
import '../widgets/product_list.dart';



class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final products = productProvider.products;
    final categories = categoryProvider.categories;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Carrito"),
        titleTextStyle: GoogleFonts.montserrat(
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        shrinkWrap: true,
        children: [
          const ProductList(),
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            height: 600,
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categorias",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CategoriesListView(
                  categories: categories,
                  products: products,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
