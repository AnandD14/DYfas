import 'package:flutter/material.dart';

class EmptyBasketScreen extends StatelessWidget {
  const EmptyBasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return Padding(
      padding: const EdgeInsets.all(30.0),
      // 2
      child: Center(
        // 3
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/images/empty_cart.png.jpeg'),
              ),
            ),
            Text(
              'Nothing Yet',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 16.0),
            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Products'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
