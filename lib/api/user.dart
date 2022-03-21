import 'package:news_app/api/request_util.dart';

import '../models/user.dart';

const String prefix = '/users/';

Future<User> detail(id) async {
  final data = await RequestUtil.get(prefix + id);
  return User.fromJson(data);
}