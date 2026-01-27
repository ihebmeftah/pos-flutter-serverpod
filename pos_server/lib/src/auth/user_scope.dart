import 'package:serverpod/server.dart';

class UserScope extends Scope {
  const UserScope(String super.name);

  static const owner = UserScope('owner');
  static const employer = UserScope('employer');
  static const customer = UserScope('customer');
}
