import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shopping_app/constatns/global_var.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFButton(
      shape: GFButtonShape.pills,
      blockButton: true,
      fullWidthButton: true,
      color: color == null ? GlobalVariables.secondaryColor : Colors.black,
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.white : color,
        ),
      ),
      onPressed: onTap,
    );
  }
}
