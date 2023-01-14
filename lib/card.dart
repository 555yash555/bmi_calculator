import 'package:flutter/material.dart';
import 'constants.dart';
void default1() {}

class card extends StatelessWidget {
  card({
    this.color = default_color_for_card,
    this.onpress = default1,
    this.widget = const SizedBox.expand(),
  });
  // final Function onPress;
  final Color color;
  final Widget widget;
  final VoidCallback onpress;

  // final Widget widget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: widget,
        margin: EdgeInsets.all(margin_for_card),
        // height: 200.00,
        // width: 400.00,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(border_radius_for_card),
        ),
      ),
    );
  }
}
