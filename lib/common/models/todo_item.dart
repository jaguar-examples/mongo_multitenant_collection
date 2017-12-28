library model;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'todo_item.g.dart';

class TodoItem {
  String id;

  String title;

  void clone(final TodoItem other) {
    id = other.id;
    title = other.title;
  }
}

class User {
  String id;

  String username;
}

@GenSerializer()
class TodoItemSerializer extends Serializer<TodoItem>
    with _$TodoItemSerializer {
  TodoItem createModel() => new TodoItem();
}

@GenSerializer()
class UserSerializer extends Serializer<User> with _$UserSerializer {
  User createModel() => new User();
}

abstract class JsonSerializers {
  static final TodoItemSerializer todoItem = new TodoItemSerializer();

  static final TodoItemSerializer user = new TodoItemSerializer();
}
