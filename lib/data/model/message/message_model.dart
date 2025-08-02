import 'package:resumebuilderadmin/core/wtoolbox/clean_architecture/entity/wt_entity.dart';
import 'package:resumebuilderadmin/domain/entity/message/message.dart';

class MessageMapper {

  static Message toEntity(MessageModel model) {
    return Message(
      key:     model.key,
      date:    model.date,
      id:      model.id,
      read:    model.read,
      headers: model.headers,
      body:    model.body,
    );
  }

  static MessageModel toModel(Message entity) {
    return MessageModel(
      key:     entity.key,
      date:    entity.date,
      id:      entity.id,
      read:    entity.read,
      headers: entity.headers,
      body:    entity.body,
    );
  }

}

class MessageModel extends WTEntity<MessageModel> {

  MessageModel({
    super.key,
    super.date,
    this.id,
    this.read,
    this.headers,
    this.body,
  });

  String? id; // db generated id
  void setId(String? v) { id = v; }

  bool? read; // is MessageModel read ( true || false )
  void setRead(bool? v) { read = v; }

  Map<String, String>? headers; // MessageModel headers
  void setHeaders(Map<String, String>? v) { headers = v; }

  String? body; // (JSON encoded) MessageModel body
  void setBody(String? v) { body = v; }

  @override
  Map<String, dynamic>? toJson() {
    return {
      'key':     key,
      'id':      id,
      'date':    date,
      'read':    read,
      'headers': headers,
      'body':    body,
    };
  }

  @override
  MessageModel? fromJson(Map? json) {
    return MessageModel(
      key:     json!['key'],
      id:      json['id'],
      date:    json['date'],
      read:    json['read'],
      headers: { ...json['headers'] },
      body:    json['body'],
    );
  }

  @override
  MessageModel? empty() {
    return MessageModel(
      key:     0,
      id:      '',
      date:    '',
      read:    true,
      headers: {},
      body:    '',
    );
  }

}