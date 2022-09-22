import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../core/constants/hex_color_code.dart';
import '../../core/tools/color_tools.dart';
import '../../core/app_routes.dart';
import '../../core/constants/strings.dart';
import '../../core/services/local_storage_services.dart';
import '../../domain/usecases/authentication_use_case.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationUseCase);
  final AuthenticationUseCase _authenticationUseCase;

  final localStorage = Get.find<LocalStorageService>();
  final isLogged = false.obs;
  final watchPassword = true.obs;

  final emailEditingController  = TextEditingController();
  final passwordEditingController = TextEditingController();
  late final FocusNode emailFocusNode = FocusNode();
  late final FocusNode passFocusNode = FocusNode();

  @override
  void onInit() async {
    super.onInit();
    isLogged.value = localStorage.getStringValue(StringData.tokenKey) != null;
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    passwordEditingController.dispose();
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  void toggleWatchPassword(bool status){
    watchPassword(status);
  }
  void toggleAuth(bool status){
    isLogged(status);
  }

  Future<void> createEmailAccount(String email, String password) async {
    EasyLoading.show(
      status: StringData.loadingText,
      maskType: EasyLoadingMaskType.black,
    );
    final account = await _authenticationUseCase.createEmailAccount(email, password);
    if(account.errorTitle != null && account.errorDesc != null){
      Get.snackbar(
        account.errorTitle.toString(),
        account.errorDesc.toString(),
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HexColor(HexColorCode.whiteBackgroundColor),
      );
    }else{
      Get.snackbar(
        "Success",
        StringData.createAccountSuccessText,
        icon: const Icon(Icons.email, color: Colors.black),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HexColor(HexColorCode.whiteBackgroundColor),
      );
    }
    EasyLoading.dismiss();
  }

  Future<void> loginEmailAccount(String email, String password) async {
    EasyLoading.show(
      status: StringData.loadingText,
      maskType: EasyLoadingMaskType.black,
    );
    final authorization = await _authenticationUseCase.accountLogin(email, password);
    if(authorization.errorMessage == null){
      if(authorization.id != null && authorization.token != null){
        _saveToken(authorization.id!, authorization.token!);
        _saveUser(email);
        Get.offNamed(AppRoutes.messages, arguments: email);
      }
    }else{
      Get.snackbar(
        "Error",
        authorization.errorMessage!.toString(),
        icon: const Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HexColor(HexColorCode.whiteBackgroundColor),
      );
    }
    EasyLoading.dismiss();
  }

  _saveToken(String id, String token){
    localStorage.storeStringValue(StringData.tokenIDKey, id);
    localStorage.storeStringValue(StringData.tokenKey, token);
  }
  _saveUser(String email){
    localStorage.storeStringValue(StringData.emailKey, email);
  }

}
