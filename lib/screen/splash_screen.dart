import 'package:provider/provider.dart';
import '../Model/models.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // TODO: SplashScreen MaterialPage Helper
  static MaterialPage page() {
    return MaterialPage(
      name: DyFasPages.splashPath,
      key: ValueKey(DyFasPages.splashPath),
      child: const SplashScreen(),
    );
  }


  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO: Initialize App
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              height: 200,
              image: AssetImage('assets/images/empty_cart.png.jpeg'),
            ),
            const Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
