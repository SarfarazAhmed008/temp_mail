import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/constants/hex_color_code.dart';
import '../core/tools/color_tools.dart';
import '../core/app_routes.dart';

class Application extends StatelessWidget {
  const Application({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'TempMail',
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: HexColor(HexColorCode.appPrimaryColor),
            ),
            scaffoldBackgroundColor: HexColor(HexColorCode.appBackgroundColor),
            dividerColor: Colors.transparent,
          ),
          initialRoute: AppRoutes.domain,
          getPages: AppPages.pages,
          builder: EasyLoading.init(),
        );
      }
    );
  }
}
