part of server.apis;

/// This route group contains login and logout routes
@Api(path: '/auth')
@WrapOne(#mongoDb)
class AuthRoutes extends BaseApi {
  /// Basic authentication interceptor
  BasicAuth basicAuth(Context ctx) =>
      new BasicAuth(_modelManager(ctx.getInput(MongoDb)));

  /// Route to login
  @Post(path: '/login')
  @WrapOne(#basicAuth)
  void login(Context ctx) {}

  @Post(path: '/logout')
  logout(Context ctx) async {
    (await ctx.session).clear();
  }
}
