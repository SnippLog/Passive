import 'package:equatable/equatable.dart';

class ViewState<T> extends Equatable {
  final bool loading;
  final T? data;
  final String? error;

  ViewState([this.loading = false, this.data, this.error]);

  ViewState.loading()
      : loading = true,
        data = null,
        error = null;

  ViewState.data(T data)
      : loading = false,
        data = data,
        error = null;

  ViewState.error(String error)
      : loading = false,
        data = null,
        error = error;

  @override
  List<Object?> get props => [loading, data, error];
}
