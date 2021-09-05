// FIXME In future create modules per layer
import 'package:get_it/get_it.dart';
import 'package:passive/domain/repository/password_repository.dart';
import 'package:passive/domain/users/get_password_list_use_case.dart';
import 'package:passive/ui/passwords/passwords_bloc.dart';

class Module {
  static void init() {
    final getIt = GetIt.instance;

    getIt.registerSingleton<PasswordRepository>(PasswordRepository());
    // TODO Find way to instantiate Bloc without state in constructor
    getIt.registerFactory<PasswordsBloc>(() => PasswordsBloc(PasswordsViewState.loading()));
    getIt.registerFactory<GetPasswordListUseCase>(() => GetPasswordListUseCase());
  }
}