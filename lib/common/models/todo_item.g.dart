// GENERATED CODE - DO NOT MODIFY BY HAND

part of model;

// **************************************************************************
// Generator: SerializerGenerator
// Target: class TodoItemSerializer
// **************************************************************************

abstract class _$TodoItemSerializer implements Serializer<TodoItem> {
  Map toMap(TodoItem model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
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
    model.id = map["id"];
    model.title = map["title"];
    return model;
  }

  String modelString() => "TodoItem";
}

// **************************************************************************
// Generator: SerializerGenerator
// Target: class UserSerializer
// **************************************************************************

abstract class _$UserSerializer implements Serializer<User> {
  Map toMap(User model, {bool withType: false, String typeKey}) {
    Map ret = new Map();
    if (model != null) {
      if (model.id != null) {
        ret["id"] = model.id;
      }
      if (model.username != null) {
        ret["username"] = model.username;
      }
      if (modelString() != null && withType) {
        ret[typeKey ?? defaultTypeInfoKey] = modelString();
      }
    }
    return ret;
  }

  User fromMap(Map map, {User model, String typeKey}) {
    if (map is! Map) {
      return null;
    }
    if (model is! User) {
      model = createModel();
    }
    model.id = map["id"];
    model.username = map["username"];
    return model;
  }

  String modelString() => "User";
}
