library server.apis;

import 'dart:async';
import 'package:jaguar/jaguar.dart';
import 'package:mongo_dart/mongo_dart.dart' as mgo;
import 'package:jaguar_mongo/jaguar_mongo.dart';

import 'package:mongo_multitenant_collection/common/models/todo_item.dart';
import 'package:mongo_multitenant_collection/server/db/serializers/serializers.dart';
import 'package:jaguar_auth/jaguar_auth.dart';
import 'package:jaguar_auth_mongo/jaguar_auth_mongo.dart';

part 'tasks_api.dart';
part 'auth_api.dart';

const mongoUrl = "mongodb://localhost:27018/todos";
const todoColBase = 'todo_';

MgoUserManager<DbUser> _modelManager(mgo.Db db) =>
    new MgoUserManager<DbUser>(MgoSerializers.user);

class BaseApi {
  /// Authorization interceptor
  Authorizer authorizer(Context ctx) =>
      new Authorizer(_modelManager(ctx.getInput(MongoDb)));

  /// MongoDb interceptor
  MongoDb mongoDb(Context ctx) => new MongoDb('mongodb://localhost:27017/test');
}

@Api(path: '/api')
class App {
  @IncludeApi()
  final AuthRoutes auth = new AuthRoutes();

  @IncludeApi()
  final TodoApi todo = new TodoApi();
}
