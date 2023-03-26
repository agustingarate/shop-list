import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/widgets/product_detail.dart';
import 'dart:ui' show ImageFilter;

import '../Logic/cart_provider.dart';
import '../models/product.dart';

class ProductCard extends StatefulWidget {
  ProductCard({super.key, required this.product, this.deletingAnimation = false,});
  final bool deletingAnimation;
  final Product product;
  int duration = 300;
  double opacity = 1;


  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _circleHoverController;
  late Animation<Color?> _animation;
  late ColorTween _tween;


  Color color = Colors.white;
  double _radius = 0;

  @override
  void initState() {
    initAnimationControllers();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _circleHoverController.dispose();
    super.dispose();
  }

  void initAnimationControllers() {

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      upperBound: 400,
    );

    _circleHoverController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final bool contains = provider.productsInList.contains(widget.product);

    _tween =
        ColorTween(
            begin: Theme.of(context).colorScheme.secondary,
            end: (contains ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.primary));

    _animation = _tween.animate(
      CurvedAnimation(
        parent: _circleHoverController,
        curve: Curves.ease,
      ),
    );


    return GestureDetector(
      onTap: () {
        if (contains) {
          widget.deletingAnimation ? setState((){widget.opacity = 0.0;}) : null;
          Timer(Duration(milliseconds: widget.duration), () {
            provider.removeProduct(widget.product);
          });
        } else {
          provider.addProducts(widget.product);
        }
      },
      onLongPress: () {
        _controller.forward();
        _circleHoverController.forward();



        Timer(const Duration(milliseconds: 300), () {
          setState((){
            _circleHoverController.reverse();
            _controller.reverse();
          });
          initAnimationControllers();
          showModalBottomSheet(
            barrierColor: Colors.black.withOpacity(0.7),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                topRight: Radius.circular(14),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              final theme = Theme.of(context);
              // Using Wrap makes the bottom sheet height the height of the content.
              // Otherwise, the height will be half the height of the screen.
              return ProductDetail(product: widget.product);
            },
          );
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: widget.duration),
        opacity: widget.opacity,
        child: Container(
          decoration: BoxDecoration(
            color: contains
                ? Theme.of(context).colorScheme.primaryContainer
                : Theme.of(context).colorScheme.primary,
          ),
          margin: const EdgeInsets.all(1.8),
          padding: const EdgeInsets.all(8),
          child: Stack(alignment: Alignment.center, children: [
            AnimatedBuilder(
                animation: CurvedAnimation(
                  curve: Curves.ease,
                  parent: _controller,
                ),
                builder: (context, Widget? child) {
                  return CircleAvatar(
                          backgroundColor: _animation.value,
                          radius: _radius + _controller.value,
                        );
                },
            ),
            Text(
              "${widget.product.name} (${widget.product.quantity})",
              textAlign: TextAlign.center,
              style: GoogleFonts.secularOne(
                textStyle: TextStyle(
                  color: contains
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.onPrimary,
                  fontSize: 17,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
