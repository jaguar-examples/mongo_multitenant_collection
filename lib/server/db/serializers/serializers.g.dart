// GENERATED CODE - DO NOT MODIFY BY HAND

part of server.db.serializers;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TodoItemMongoSerializer
// **************************************************************************

abstract class _$TodoItemMongoSerializer implements Serializer<TodoItem> {
  final MongoId idMongoId = const MongoId();

  Map toMap(TodoItem model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = idMongoId.serialize(model.id);
      }
      if (model.title != null) {
        ret["title"] = model.title;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  TodoItem fromMap(Map map, {TodoItem model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! TodoItem) {
      model = createModel();
    }
    model.id = idMongoId.deserialize(map["_id"]);
    model.title = map["title"];
    return model;
  }

  String modelString() => "TodoItem";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class DbUserMongoSerializer
// **************************************************************************

abstract class _$DbUserMongoSerializer implements Serializer<DbUser> {
  final MongoId idMongoId = const MongoId();

  Map toMap(DbUser model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["_id"] = idMongoId.serialize(model.id);
      }
      if (model.username != null) {
        ret["username"] = model.username;
      }
      if (model.password != null) {
        ret["password"] = model.password;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  DbUser fromMap(Map map, {DbUser model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! DbUser) {
      model = createModel();
    }
    model.id = idMongoId.deserialize(map["_id"]);
    model.username = map["username"];
    model.password = map["password"];
    return model;
  }

  String modelString() => "DbUser";
}
