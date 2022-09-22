import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';

class DomainWidget extends StatelessWidget{
  const DomainWidget({super.key, required this.domainName});

  final String? domainName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Card(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: Icon(Icons.mail, color: HexColor(HexColorCode.appPrimaryColor)),
          title: domainName != null ?
            Text(domainName!,
              style: TextStyle(
                color: HexColor(HexColorCode.lightBlackTextColor),
                fontSize: 18.sp,
              ),
            ) : const SizedBox(),
        ),
      ),
    );
  }

}
