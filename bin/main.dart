import 'package:jaguar/jaguar.dart';

import 'package:mongo_multitenant_collection/server/api/api.dart';

main() async {
  final server = new Jaguar();
  server.addApiReflected(new App());
  await server.serve();
}
