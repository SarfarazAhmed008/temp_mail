import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/constants/hex_color_code.dart';
import '../../../core/tools/color_tools.dart';

class CardShimmerLoad extends StatelessWidget{
  const CardShimmerLoad({Key? key, required this.boxHeight}) : super(key: key);

  final double boxHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor(HexColorCode.appBackgroundColor),
      elevation: 0.0,
      child: Shimmer.fromColors(
        baseColor: HexColor(HexColorCode.whiteBackgroundColor),
        highlightColor: HexColor(HexColorCode.appBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Container(
              width: double.infinity,
              height: boxHeight.h,
              margin: EdgeInsets.symmetric(horizontal: 10.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: HexColor(HexColorCode.whiteBackgroundColor),
              ),
            ),

            SizedBox(height: 30.0.h),

          ],
        ),
      ),
    );
  }

}