library server.db.serializers;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:jaguar_serializer_mongo/jaguar_serializer_mongo.dart';
import 'package:jaguar_common/jaguar_common.dart';

import 'package:mongo_multitenant_collection/common/models/todo_item.dart';

part 'serializers.g.dart';

class DbUser extends UserUsername {
  String id;

  String username;

  String password;
}

@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
})
class TodoItemMongoSerializer extends Serializer<TodoItem>
    with _$TodoItemMongoSerializer {
  TodoItem createModel() => new TodoItem();
}

@GenSerializer(fields: const {
  'id': const EnDecode(alias: '_id', processor: const MongoId()),
})
class DbUserMongoSerializer extends Serializer<DbUser>
    with _$DbUserMongoSerializer {
  DbUser createModel() => new DbUser();
}

abstract class MgoSerializers {
  static final TodoItemMongoSerializer todoItem = new TodoItemMongoSerializer();

  static final DbUserMongoSerializer user = new DbUserMongoSerializer();
}
