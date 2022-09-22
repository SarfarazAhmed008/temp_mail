import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {Key? key,
        this.controller,
        this.hintText,
        required this.textInputType,
        this.onPressed,
        this.icon,
        this.readOnly = false,
        this.validator,
        this.suffixIcon,
        this.prefixIcon,
        this.obscureText = false,
        this.fillColor,
        this.filled,
        this.maxLength,
        this.counter,
        this.errorText,
        this.focusNode,
        this.initialValue,
        this.textAlign = TextAlign.start,
        this.enableSuggestions = true,
        this.onFieldSubmitted,
        this.hasBorder = false,
        this.autocorrect = true})
      : super(key: key);

  final String? hintText;
  final TextInputType textInputType;
  final bool readOnly;
  final Function()? onPressed;

  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final bool? filled;
  final bool enableSuggestions;
  final bool autocorrect;
  final int? maxLength;
  final TextAlign textAlign;
  final Widget? counter;
  final FocusNode? focusNode;
  final String? errorText;
  final String? initialValue;
  final Function(String)? onFieldSubmitted;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
      return TextFormField(
        onTap: onPressed,
        readOnly: readOnly,
        initialValue: initialValue,
        focusNode: focusNode,
        controller: controller,
        maxLength: maxLength,
        keyboardType: textInputType,
        obscureText: obscureText,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        style: TextStyle(
          color: HexColor(HexColorCode.lightBlackTextColor),
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        textAlign: textAlign,
        decoration: InputDecoration(
          counter: counter,
          fillColor: fillColor,
          filled: filled,
          enabledBorder: hasBorder ? OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(HexColorCode.appPrimaryColor), width: 0.4),
            borderRadius: BorderRadius.circular(15.0),
          ) : OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(HexColorCode.whiteBackgroundColor), width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: hasBorder ? OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(HexColorCode.appPrimaryColor), width: 0.4),
            borderRadius: BorderRadius.circular(15.0),
          ) : OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(HexColorCode.whiteBackgroundColor), width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          errorText: errorText,
          errorStyle: TextStyle(
            fontSize: 10.sp,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            color: HexColor(HexColorCode.greyTextColor),
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
        ),
      );

  }
}
