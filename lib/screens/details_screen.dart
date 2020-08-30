import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/models/product.dart';
import 'package:furniture_app/widgets/chat_and_cart.dart';
import 'package:furniture_app/widgets/color_dot.dart';
import 'package:furniture_app/widgets/product_poster.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        centerTitle: false,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/back.svg"),
        ),
        title: Text(
          "BACK",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/cart_with_item.svg"),
          )
        ],
      ),
      body: SingleChildScrollView(child: Body(product: product ?? products[0])),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: '${product.id}',
                child: ProductPoster(
                  image: product.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPadding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorDot(
                      color: Color(0xFF80989A),
                      selected: true,
                    ),
                    ColorDot(
                      color: Color(0xFFFF5200),
                    ),
                    ColorDot(
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Text(
                '\$${product.price}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kSecondaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
                child: Text(
                  product.description,
                  style: TextStyle(color: kTextLightColor),
                ),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        ),
        ChatAndCart(),
      ],
    );
  }
}
