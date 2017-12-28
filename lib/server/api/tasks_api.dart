part of server.apis;

@Api(path: '/todos')
@Wrap(const [#mongoDb])
class TodoApi extends BaseApi {
  /// Returns task collection for the current user
  mgo.DbCollection getUserCollection(Context ctx) {
    DbUser user = ctx.getInput<DbUser>(MongoDb); // TODO
    mgo.Db db = ctx.getInput<mgo.Db>(MongoDb);
    return db.collection(todoColBase + user.id);
  }

  /// Returns all task items for the user
  @Get()
  Future<Response<String>> getAll(Context ctx) async {
    List<Map> res =
        await (await getUserCollection(ctx).find()).map(_mgoToJson).toList();
    return Response.json(res);
  }

  /// Returns a task item by id
  @Get(path: '/:id')
  Future<Response<String>> getById(Context ctx) async {
    String id = ctx.pathParams['id'];

    Map res = await getUserCollection(ctx)
        .findOne(mgo.where.id(mgo.ObjectId.parse(id)));
    return Response.json(_mgoToJson(res));
  }

  /// Inserts new task item
  @Post()
  Future<Response<String>> insert(Context ctx) async {
    // Parse new item from JSON body
    Map body = await ctx.req.bodyAsJsonMap();
    TodoItem todo = JsonSerializers.todoItem.fromMap(body);

    // Create and set new Id
    final String id = new mgo.ObjectId().toHexString();
    todo.id = id;

    mgo.DbCollection coll = getUserCollection(ctx);
    await coll.insert(_mgoEnc(todo));

    Map res = await coll.findOne(mgo.where.id(mgo.ObjectId.parse(id)));
    return Response.json(_mgoToJson(res));
  }

  /// Deletes a task by id
  @Delete(path: '/:id')
  Future<Response<String>> deleteById(Context ctx) async {
    String id = ctx.pathParams['id'];

    mgo.DbCollection coll = getUserCollection(ctx);
    await coll.remove(mgo.where.id(mgo.ObjectId.parse(id)));

    List<Map> res = await (await coll.find()).map(_mgoToJson).toList();
    return Response.json(res);
  }

  /// Deletes all tasks belonging to the current user
  @Delete()
  Future deleteAll(Context ctx) async {
    await getUserCollection(ctx).remove(mgo.where);
  }

  Map _mgoEnc(TodoItem item) => MgoSerializers.todoItem.toMap(item);

  Map _mgoToJson(Map map) =>
      JsonSerializers.todoItem.toMap(MgoSerializers.todoItem.fromMap(map));
}
