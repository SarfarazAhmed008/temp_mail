import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';

class MessageWidget extends StatelessWidget{
  const MessageWidget({
    super.key,
    required this.subject,
    required this.intro,
    required this.senderName,
    required this.senderMail,
    required this.receiverName,
    required this.receiverMail,
    this.updatedTime
  });

  final String? subject;
  final String? intro;
  final String? senderName;
  final String? senderMail;
  final String? receiverName;
  final String? receiverMail;
  final String? updatedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0.h,),
              Text("From",
                style: TextStyle(
                  color: HexColor(HexColorCode.appPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.0.h,),
              Text("${senderName!} <${senderMail!}>",
                style: TextStyle(
                  color: HexColor(HexColorCode.lightBlackTextColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.0.h,),
              Text("To",
                style: TextStyle(
                  color: HexColor(HexColorCode.appPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.0.h,),
              Text("${receiverName!} <${receiverMail!}>",
                style: TextStyle(
                  color: HexColor(HexColorCode.lightBlackTextColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.0.h,),
              Text("Time",
                style: TextStyle(
                  color: HexColor(HexColorCode.appPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.0.h,),
              Text(updatedTime!,
                style: TextStyle(
                  color: HexColor(HexColorCode.lightBlackTextColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 20.0.h,),
              Text("Subject",
                style: TextStyle(
                  color: HexColor(HexColorCode.appPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.0.h,),
              Text(subject!,
                style: TextStyle(
                  color: HexColor(HexColorCode.lightBlackTextColor),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.0.h,),
              Text("Details",
                style: TextStyle(
                  color: HexColor(HexColorCode.appPrimaryColor),
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.0.h,),
              Text(intro!,
                style: TextStyle(
                  color: HexColor(HexColorCode.lightBlackTextColor),
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 10.0.h,),
            ],
          ),
        ),
      ),
    );
  }

}
