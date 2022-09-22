import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constants/hex_color_code.dart';
import '../../core/constants/strings.dart';
import '../controllers/authentication_controller.dart';
import '../widgets/curve_header_widget.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/animation/animation_widget.dart';
import '../../core/tools/color_tools.dart';

class AuthenticationScreen extends StatefulWidget{
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {

  final AuthenticationController authenticationController = Get.find<AuthenticationController>();

  final _formKey = GlobalKey<FormState>();

  _sendAuthRequest(){
    if (authenticationController.emailFocusNode.hasFocus) {
      authenticationController.emailFocusNode.unfocus();
    }
    if (authenticationController.passFocusNode.hasFocus) {
      authenticationController.passFocusNode.unfocus();
    }
    if (_formKey.currentState!.validate()) {
      if (authenticationController.emailEditingController.text.isNotEmpty &&
          authenticationController.passwordEditingController.text.isNotEmpty) {
        if(authenticationController.isLogged.value){
          authenticationController.loginEmailAccount(
            "${authenticationController.emailEditingController.text}@${Get.arguments}",
            authenticationController.passwordEditingController.text,
          );
        }else{
          authenticationController.createEmailAccount(
            "${authenticationController.emailEditingController.text}@${Get.arguments}",
            authenticationController.passwordEditingController.text,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringData.appBarText),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() =>
        CustomScrollView(
          slivers: <Widget>[
            AppCurvedHeaderWidget(
              headerName: authenticationController.isLogged.value ? StringData.emailLoginText : StringData.createAccountText,
            ),
            SliverList(delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 25.h,),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: CustomTextFormField(
                                  focusNode: authenticationController.emailFocusNode,
                                  controller: authenticationController.emailEditingController,
                                  textInputType: TextInputType.emailAddress,
                                  fillColor: HexColor(HexColorCode.whiteBackgroundColor),
                                  filled: true,
                                  hintText: StringData.emailHintText,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty)
                                      return 'Enter an email address';
                                    else
                                      return null;
                                  },
                                ),
                              ),
                              SizedBox(width: 10.0.w,),
                              Expanded(
                                flex: 3,
                                child: Text("@${Get.arguments.toString()}"),
                              ),

                            ],
                          ),
                          SizedBox(height: 20.h,),
                          CustomTextFormField(
                            focusNode: authenticationController.passFocusNode,
                            controller: authenticationController.passwordEditingController,
                            counter: const Offstage(),
                            maxLength: 25,
                            obscureText: authenticationController.watchPassword.value ? true : false,
                            enableSuggestions: false,
                            autocorrect: false,
                            textInputType: TextInputType.text,
                            fillColor: HexColor(HexColorCode.whiteBackgroundColor),
                            filled: true,
                            hintText: StringData.passwordHintText,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            suffixIcon: GestureDetector(
                              onTap: () {
                                authenticationController.toggleWatchPassword(!authenticationController.watchPassword.value);
                              },
                              child: authenticationController.watchPassword.value
                                  ? Icon(
                                Icons.remove_red_eye_rounded,
                                color: HexColor(HexColorCode.appPrimaryColor),
                                size: 25.0.h,
                              )
                                  : Icon(
                                Icons.remove_red_eye_outlined,
                                color: HexColor(HexColorCode.greyTextColor),
                                size: 25.0.h,
                              ),
                            ),
                          ),

                          SizedBox(height: 30.h,),
                          AnimationWidget(
                            child: CustomElevatedButton(
                              onPressed: () {
                                _sendAuthRequest();
                              },
                              minimumSize: Size(45.0.w, 60.0.h),
                              primaryColor: HexColor(HexColorCode.appPrimaryColor),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  authenticationController.isLogged.value
                                      ? Text(
                                    StringData.loginButtonText,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color:
                                      HexColor(HexColorCode.whiteTextColor),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                      : Text(
                                    StringData.createButtonText,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      color:
                                      HexColor(HexColorCode.whiteTextColor),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 40.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  authenticationController.toggleAuth(!authenticationController.isLogged.value);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: authenticationController.isLogged.value ?
                                    StringData.dontHaveAccountForRegisterText
                                        : StringData.dontHaveAccountForLoginText,
                                    style: TextStyle(
                                      fontSize: 16.0.sp,
                                      fontWeight: FontWeight.normal,
                                      color: HexColor(HexColorCode.greyTextColor),
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: authenticationController.isLogged.value
                                              ? "  " + StringData.createButtonText
                                              : "  " + StringData.loginButtonText,
                                          style: TextStyle(
                                              color: HexColor(
                                                  HexColorCode.lightBlackTextColor),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16.sp),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              authenticationController.toggleAuth(!authenticationController.isLogged.value);
                                            }),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ]
            ),),

          ],
        ),
      ),
    );
  }
}
