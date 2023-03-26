import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(14),
          topLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
          bottomLeft: Radius.circular(14),
        ),
      ),
      height: 64,
      margin: const EdgeInsets.only(
          top: 3,
          bottom: 3,
          right: 10,
          left: 10,
      ),
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Text(
              title,
              style: GoogleFonts.secularOne(
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ),
          Expanded(
              child: Container(),
          ),
          Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}
