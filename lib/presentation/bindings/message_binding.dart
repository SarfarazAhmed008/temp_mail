import 'package:get/get.dart';
import '../../data/repositories/message_repository.dart';
import '../../domain/usecases/fetch_messages_use_case.dart';
import '../controllers/message_controller.dart';

class MessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageRepositoryImp());
    Get.lazyPut(() => FetchMessagesUseCase(Get.find<MessageRepositoryImp>()));
    Get.lazyPut(() => MessageController(Get.find<FetchMessagesUseCase>()));
  }
}
