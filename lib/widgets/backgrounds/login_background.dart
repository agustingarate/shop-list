import 'package:flutter/widgets.dart';

class LoginBackground extends StatelessWidget {
  final Widget child;
  final AlignmentGeometry center;
  const LoginBackground({
    super.key,
    required this.child,
    required this.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: const [
            Color.fromARGB(255, 60, 58, 156),
            Color.fromARGB(255, 54, 38, 124),
            Color.fromARGB(255, 49, 36, 61),
            Color.fromARGB(255, 35, 32, 46),
            Color(0xFF1C1B1F),
          ],
          center: center,
          radius: 0.8,
          stops: const [
            0.03,
            0.2,
            0.5,
            0.7,
            1,
          ],
        ),
      ),
      child: child,
    );
  }
}
