import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_list/widgets/backgrounds/login_background.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        center: Alignment.bottomRight,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              scale: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Boost the way you do shopping",
                    style: GoogleFonts.montserrat(
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Choose the groceries you need and save them in a unique place."
                    " You wont forget them anymore",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const _LoginButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.7;
    return Container(
      width: size,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        color: Theme.of(context).colorScheme.surfaceVariant,
      ),
      child: Row(
        children: [
          Container(
            width: size / 2,
            height: 70,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            child: Center(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 215, 237, 255),
                  ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/register");
                },
                child: Text(
                  "Register",
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 68, 68, 68),
                ),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () => Navigator.pushNamed(context, "/login"),
              child: Text(
                "Sign In",
                style: GoogleFonts.montserrat(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
