import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/widgets/product_card.dart';

import '../Logic/cart_provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with SingleTickerProviderStateMixin {
  late AnimationController imageAnimationController;
  late Animation<Offset> imageAnimation;


  @override
  void initState() {
    // TODO: implement initState
    imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    )..repeat(
        reverse: true,
      );


    imageAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0.04))
            .animate(
            CurvedAnimation(
                parent: imageAnimationController,
                curve: Curves.decelerate,
            ),
        );
    super.initState();
  }

  @override
  void dispose() {
    imageAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      child: Builder(
        builder: (BuildContext context) {
          if (provider.productsInList.isNotEmpty) {
            return GridView.count(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              crossAxisCount: 3,
              childAspectRatio: 0.95,
              children: List.generate(
                provider.productsInList.length,
                (i) {
                  return ProductCard(
                      product: provider.productsInList[i],
                      deletingAnimation: true,
                  );
                },
              ),
            );
          } else {
            return Column(
              children: [
                const SizedBox(
                  height: 23,
                ),
                SlideTransition(
                  position: imageAnimation,
                  child: Image.asset(
                    "assets/images/Shopping cart_Monochromatic.png",
                    scale: 1.8,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "¡Comienza agregando productos al carrito!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 19,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
