import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_list/Logic/Login/sign_in_provider.dart';
import 'package:shop_list/models/sign_in_response.dart';
import 'package:shop_list/widgets/widgets.dart';
import 'package:shop_list/styles/styles.dart';
import 'package:shop_list/utils/utils.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        center: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios_new_sharp),
                ),
                const SizedBox(
                  height: 20,
                ),
                const _TitleText(
                  "Let's sign you in.",
                  fontWeight: FontWeight.bold,
                ),
                const _TitleText(
                  "Welcome back.\nYou've been missed!",
                ),
                const _Login(),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class _TitleText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  const _TitleText(
    this.text, {
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 45,
        fontWeight: fontWeight,
      ),
    );
  }
}

class _Login extends StatefulWidget {
  const _Login({super.key});

  @override
  State<_Login> createState() => _LoginState();
}

class _LoginState extends State<_Login> {
  late SignInProvider signInProvider;
  String? errorMsg;

  @override
  Widget build(BuildContext context) {
    signInProvider = Provider.of<SignInProvider>(context);
    return Form(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: signInProvider.emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            decoration: InputDecorations.login(
              labelText: "Email",
              context: context,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: signInProvider.passwordController,
            obscureText: true,
            decoration: InputDecorations.login(
              labelText: "Password",
              context: context,
              icon: Icons.password,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Container(
            width: double.infinity,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, "/register"),
                child: const Text(
                  "Sign up",
                ),
              ),
            ],
          ),
          ButtonLoginRegister(
            label: "Sign in",
            onPressed: () async {
              final response = await signInProvider.signIn();
              if (response.user != null && mounted) {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);
              } else if (response.user == null) {
                final error = signInProvider.getLoginException(response.error!);
                errorMsg = error.mensaje;
                setState(() {});
                ScaffoldMessenger.of(context)
                    .showSnackBar(CustomSnackbar.get(text: errorMsg!));
              }
            },
          ),
          const SizedBox(
            height: 300,
          ),
        ],
      ),
    );
  }
}
