import 'package:flutter/material.dart';
import 'package:shop_list/pages/category_products_page.dart';
import 'package:shop_list/widgets/category_card.dart';

import '../models/category.dart';
import '../models/product.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key, required this.categories, required this.products});
  final List<Category> categories;
  final List<Product> products;

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.categories.length,
        itemBuilder: (BuildContext context, i) {
          return GestureDetector(
            onTap: () async {
              await Navigator.pushNamed(
                  context,
                  "/CategoryProductsPage",
                  arguments: CategoriesProductsPageArguments(
                      category: widget.categories[i],
                      products: widget.products,
                  )
              );
            },
            child: CategoryCard(
              title: widget.categories[i].title,
            ),
          );
        }
    );
  }
}

