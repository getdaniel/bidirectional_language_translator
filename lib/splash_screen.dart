import 'package:flutter/material.dart';
import 'routes.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 5),
      () => {
        Navigator.of(context).pushReplacementNamed(Routes.homepage),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ic_launcher.png',
              width: 140,
              height: 140,
            ),
            const Text(
              "Simple Language Translator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
