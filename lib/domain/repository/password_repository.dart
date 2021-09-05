import 'package:passive/domain/users/password.dart';

// TODO Cover with interface
class PasswordRepository {

  Future<List<Password>> getAll() => Future.delayed(
        Duration(seconds: 2),
        () => List.generate(20, (index) => Password("Password $index")),
      ); // FIXME MOCK
}
