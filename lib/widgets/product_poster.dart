import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ProductPoster extends StatelessWidget {
  const ProductPoster({
    Key key,
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding),
      width: double.infinity,
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: size.width * 0.7,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          Image.asset(
            image,
            width: size.width * 0.7,
            height: size.width * 0.7,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
