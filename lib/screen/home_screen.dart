import 'package:flutter/material.dart';
import 'package:luga_fataa/Model/home.dart';
import 'package:luga_fataa/Model/models.dart';
import 'package:luga_fataa/api/mock_homescreen_service.dart';
import 'category.dart';


class HomeScreenFuture extends StatelessWidget {

  final mockService = MockService();
  final Size size;

  HomeScreenFuture({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getImageURLs(),
      builder: (context, AsyncSnapshot<List<Home>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Category(size: size, homeItems: snapshot.data ?? []);
        } else {
            return Container(
              height: size.height * 0.7,
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()
                ));
        }
      },
    );
  }
}
