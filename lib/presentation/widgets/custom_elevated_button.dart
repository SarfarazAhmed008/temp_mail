import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.onPressed,
        this.child ,this.icons, this.minimumSize, this.primaryColor})
      : super(key: key);
  final Function() onPressed;
  final IconData? icons;
  final Widget? child;
  final Size? minimumSize;
  final Color? primaryColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: 0.0,
          minimumSize: minimumSize,
          primary: primaryColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          )
      ),
      child: child,
    );
  }
}
