import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:passive/domain/repository/password_repository.dart';
import 'package:passive/domain/users/password.dart';

class GetPasswordListUseCase {

  final PasswordRepository _passwordRepository = GetIt.instance.get();

  Future<List<Password>> invoke() => _passwordRepository
      .getAll()
      .then((passwords) => _takeOnlyEvenElements(passwords));

  // FIXME MOCK
  FutureOr<List<Password>> _takeOnlyEvenElements(List<Password> passwords) {
    return Future.value(passwords.takeWhile((pass) => passwords.indexOf(pass).isEven).toList());
  }
}
