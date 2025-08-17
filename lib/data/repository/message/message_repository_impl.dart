import '../../../domain/entity/message/message.dart';
import '../../../domain/repository/message/message_repository.dart';

class MessageRepositoryImpl extends MessageRepository {

  @override
  Future<bool?> init(int? accountKey) async {
    throw UnimplementedError();
  }

  @override
  Future<void> close() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> insert(Message? entity) async {
    throw UnimplementedError();
  }
  
  @override
  Future<bool?> update(Message? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> delete(Message? entity) async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> deleteAll() async {
    throw UnimplementedError();
  }

  @override
  Future<Message?> getByKey(int? key) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Message>?> getAll() async {
    throw UnimplementedError();
  }

  @override
  Future<bool?> isEmpty() async {
    throw UnimplementedError();
  }

}