import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';
import 'custom_medium_curve.dart';


class AppCurvedHeaderWidget extends StatelessWidget{
  const AppCurvedHeaderWidget({Key? key,
    required this.headerName
  }) : super(key: key);

  final String headerName;

  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildListDelegate(
      [
        const Divider(
          height: 0.3,
        ),
        CustomPaint(
          painter: CustomMediumCurvePainter(),
          child: SizedBox(
            width: double.infinity,
            height: 110.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15.0.h),
                Row(
                  children: <Widget>[
                    SizedBox(width: 16.0.w),

                    Expanded(
                      child: Text(headerName,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: HexColor(HexColorCode.whiteTextColor),
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    SizedBox(width: 15.w,),
                  ],
                ),

              ],
            ),
          ),
        ),
      ]
    ));
  }
}
