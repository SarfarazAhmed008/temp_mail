import '../entities/message_collection.dart';

abstract class MessageRepository {
  Future<MessageCollection> fetchMessageList(int page, String token);
}
