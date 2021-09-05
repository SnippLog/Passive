import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:passive/domain/users/get_password_list_use_case.dart';
import 'package:passive/ui/base/view_state.dart';

class PasswordsBloc extends Cubit<PasswordsViewState> {
  GetPasswordListUseCase getPasswords = GetIt.instance.get();

  PasswordsBloc(PasswordsViewState initialState) : super(initialState) {
    // On start
    emit(PasswordsViewState.loading());
    _loadData();
  }

  _loadData() async {
    var passwords = await getPasswords.invoke();
    emit(PasswordsViewState.data(passwords));
  }
}

class PasswordsViewState<T> extends ViewState<T> {
  String? _alertTitle;
  String? _alertMessage;

  PasswordsViewState.loading() : super.loading();

  PasswordsViewState.data(T data) : super.data(data);

  PasswordsViewState.error(String error) : super.error(error);

  PasswordsViewState.alert(String title, String message)
      : _alertTitle = title,
        _alertMessage = message;
}
