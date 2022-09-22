import '../entities/message_collection.dart';
import '../repositories/message_repository.dart';

class FetchMessagesUseCase {
  final MessageRepository _messageRepository;
  FetchMessagesUseCase(this._messageRepository);

  Future<MessageCollection> getMessages(int page, String token) async {
    final messages = await _messageRepository.fetchMessageList(page, token);
    return messages;
  }
}
