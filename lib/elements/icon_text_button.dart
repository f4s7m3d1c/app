import 'package:flutter/material.dart';

class IconTextButton extends StatelessWidget {
  final double? width, height;
  final Icon icon;
  final Text text;
  final VoidCallback? onPressed;
  final Color? color;

  const IconTextButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    this.color,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 5)
          ),
          backgroundColor: color == null ? null : MaterialStateProperty.all<Color>(color!)
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            text,
          ],
        ),
      ),
    );
  }
}