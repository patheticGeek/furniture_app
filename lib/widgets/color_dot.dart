import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key key,
    @required this.color,
    this.selected = false,
  }) : super(key: key);

  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: kDefaultPadding / 2.5,
      ),
      padding: EdgeInsets.all(3),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selected
            ? Border.all(
                color: Color(0xFF707070),
              )
            : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
