import 'package:provider/provider.dart';
import 'package:shop_list/Logic/Login/authentication_provider.dart';
import 'package:shop_list/Logic/Login/sign_up_provider.dart';
import 'package:shop_list/models/sign_up_response.dart';
import 'package:shop_list/styles/styles.dart';
import 'package:shop_list/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        center: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            children: [_RegisterForm()],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  SignUpProvider? signUpProvider;

  TextEditingController emailController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    signUpProvider = Provider.of<SignUpProvider>(context);
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: InputDecorations.login(
                labelText: "Email",
                context: context,
                icon: Icons.email_rounded,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecorations.login(
                labelText: "Name",
                context: context,
                icon: Icons.person_add_alt_rounded,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecorations.login(
                labelText: "Surname",
                context: context,
                icon: Icons.text_fields_rounded,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecorations.login(
                labelText: "Password",
                context: context,
                icon: Icons.password,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            ButtonLoginRegister(
              label: "Sign up",
              onPressed: () async {
                final signUpData = SignUpData(
                  email: emailController.text,
                  name: nameController.text,
                  surname: lastNameController.text,
                  password: passwordController.text,
                );

                final response = await signUpProvider!.signUp(signUpData);
                print(response.error);
                if (response.user != null && mounted) {
                  Navigator.pushReplacementNamed(context, "/");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
