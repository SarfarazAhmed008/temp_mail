import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/message_controller.dart';
import '../../core/constants/hex_color_code.dart';
import '../../core/constants/strings.dart';
import '../widgets/curve_header_widget.dart';
import '../widgets/message_widget.dart';
import '../widgets/shimmer_load/card_load.dart';
import '../../core/tools/color_tools.dart';

class MessageScreen extends StatelessWidget{
  MessageScreen({super.key});

  final MessageController messageController = Get.find<MessageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.appBarText),
        centerTitle: true,
        elevation: 0,
        actions: [
          Obx(() =>
            messageController.isLogged.value ?
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: IconButton(
                  onPressed: (){
                    messageController.logout();
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
          AppCurvedHeaderWidget(headerName: Get.arguments.toString()),
          SliverList(delegate: SliverChildListDelegate(
              [
                SizedBox(height: 25.h,),
                Row(
                  children: [
                    SizedBox(width: 25.0.w),
                    Text(
                      StringData.messageHeaderText,
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
            () => messageController.load.value ? SliverList(delegate: SliverChildListDelegate([
              const CardShimmerLoad(boxHeight: 200.0),
            ])) : messageController.messageList.isEmpty ? SliverList(delegate: SliverChildListDelegate([
                  Column(
                    children: [
                      SizedBox(height: 10.0.h,),
                      Text(StringData.emptyMessageText,
                        style: TextStyle(
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10.0.h,),
                    ],
                  ),
            ])) :  SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index){
                  return MessageWidget(
                    subject: messageController.messageList[index].subject,
                    intro: messageController.messageList[index].intro,
                    senderMail: messageController.messageList[index].from?.address,
                    senderName: messageController.messageList[index].from?.name,
                    receiverMail: messageController.messageList[index].to?.first.address,
                    receiverName: messageController.messageList[index].to?.first.name,
                    updatedTime: DateTime.parse(messageController.messageList[index].updatedAt!).toLocal().toString(),
                  );
                },
                childCount: messageController.messageList.length,
              ),
            ),
          ),

          SliverList(delegate: SliverChildListDelegate([SizedBox(height: 30.0.h,)])),

        ],
      ),
    );
  }

}
