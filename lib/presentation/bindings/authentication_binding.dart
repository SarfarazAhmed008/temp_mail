import 'package:get/get.dart';
import '../../data/repositories/authentication_repository.dart';
import '../../domain/usecases/authentication_use_case.dart';
import '../controllers/authentication_controller.dart';

class AuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationRepositoryImp());
    Get.lazyPut(() => AuthenticationUseCase(Get.find<AuthenticationRepositoryImp>()));
    Get.lazyPut(() => AuthenticationController(Get.find<AuthenticationUseCase>()));
  }
}
