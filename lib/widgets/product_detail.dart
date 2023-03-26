import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Logic/cart_provider.dart';
import '../models/product.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late TextEditingController descriptionTextController;
  late TextEditingController quantityTextController;
  late CartProvider productProvider;
  handleDescriptionTextField() {
    productProvider.updateDescription(
        descriptionTextController.text, widget.product);
    productProvider.updateQuantity(
        int.parse(quantityTextController.text), widget.product);
  }

  @override
  void initState() {
    descriptionTextController = TextEditingController();
    quantityTextController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<CartProvider>(context);
    return Container(
      height: (MediaQuery.of(context).size.height - 200),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 0,
          ),
          ListTile(
            title: Text(
              widget.product.name,
              style: GoogleFonts.montserrat(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Descripcion",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            shape: const Border(
              top: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 55,
            child: TextFormField(
              cursorColor: Theme.of(context).colorScheme.onSurface,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              controller: descriptionTextController,
              maxLines: 2,
              decoration: InputDecoration(
                  labelText: widget.product.description,
                  border: const OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.tertiary,
                  ))),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          ListTile(
            title: Text(
              "Cantidad",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 300,
                height: 50,
                child: TextFormField(
                  cursorColor: Theme.of(context).colorScheme.onSurface,
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  controller: quantityTextController,
                  decoration: InputDecoration(
                      labelText: widget.product.quantity.toString(),
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.tertiary,
                      ))),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 230,
                height: 50,
                child: MaterialButton(
                  shape: const StadiumBorder(),
                  onPressed: handleDescriptionTextField,
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: Text(
                    "Actualizar",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
