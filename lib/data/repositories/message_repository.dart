import '../remote_services/email_service.dart';
import '../models/message_collection_model.dart';
import '../../domain/repositories/message_repository.dart';

class MessageRepositoryImp extends MessageRepository {

  @override
  Future<MessageCollectionModel> fetchMessageList(int page, String token) async{
    final response = await EmailService.fetchMessages(page, token);
    return MessageCollectionModel.fromJson(response);
  }

}
