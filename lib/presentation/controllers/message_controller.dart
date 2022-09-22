import 'package:get/get.dart';
import '../../core/app_routes.dart';
import '../../core/constants/strings.dart';
import '../../core/services/local_storage_services.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/fetch_messages_use_case.dart';

class MessageController extends GetxController {
  MessageController(this._fetchMessagesUseCase);
  final FetchMessagesUseCase _fetchMessagesUseCase;

  final localStorage = Get.find<LocalStorageService>();
  RxList<Message> messageList = <Message>[].obs;
  RxBool load = true.obs;
  RxBool isLogged = false.obs;

  @override
  void onInit() {
    _loadMessages();
    isLogged.value = localStorage.getStringValue(StringData.tokenKey) != null;
    super.onInit();
  }

  Future<void> _loadMessages() async {
    String? token = localStorage.getStringValue(StringData.tokenKey);
    if(token != null){
      final messages = await _fetchMessagesUseCase.getMessages(1, token);
      messageList.assignAll(messages.messageModelList!);
      load(false);
    }else{
      load(false);
    }
  }

  void logout(){
    localStorage.clearAllValues();
    isLogged(false);
    Get.offAllNamed(AppRoutes.domain);
  }

}
