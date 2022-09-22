import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/app_routes.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/constants/strings.dart';
import '../controllers/domain_controller.dart';
import '../widgets/curve_header_widget.dart';
import '../widgets/domain_widget.dart';
import '../widgets/shimmer_load/card_load.dart';
import '../../core/tools/color_tools.dart';

class DomainScreen extends StatelessWidget{
  DomainScreen({super.key});

  final DomainController domainController = Get.find<DomainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.appBarText),
        centerTitle: true,
        elevation: 0,
        actions: [
          Obx(() =>
            domainController.isLogged.value ?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: IconButton(
                  onPressed: (){
                    domainController.logout();
                  },
                  icon: const Icon(Icons.logout),
                ),
              )
                : const SizedBox(),
          )
        ]
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const AppCurvedHeaderWidget(headerName: StringData.domainListText),
          SliverList(delegate: SliverChildListDelegate(
              [
                SizedBox(height: 25.h,),
                Row(
                  children: [
                    SizedBox(width: 25.0.w),
                    Text(
                      StringData.domainHeaderText,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: HexColor(HexColorCode.appPrimaryColor),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
              ]
            ),
          ),

          Obx(
            () => domainController.load.value ? SliverList(delegate: SliverChildListDelegate([
              const CardShimmerLoad(boxHeight: 60.0),
            ])) : domainController.domainList.isEmpty ? SliverList(delegate: SliverChildListDelegate([
              Column(
                children: [
                  SizedBox(height: 10.0.h,),
                  Text(StringData.emptyDomainText,
                    style: TextStyle(
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 10.0.h,),
                ],
              ),
            ])) : SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                  return GestureDetector(
                    onTap: (){
                      if(domainController.isLogged.value){
                        Get.toNamed(AppRoutes.messages, arguments: domainController.userEmail.value);
                      }else{
                        Get.toNamed(AppRoutes.authenticate, arguments: domainController.domainList[index].domain!);
                      }
                    },
                    child: DomainWidget(
                      domainName: domainController.domainList[index].domain,
                    ),
                  );
                },
                childCount: domainController.domainList.length,
              ),
            ),
          ),

        ],
      ),
    );
  }

}
