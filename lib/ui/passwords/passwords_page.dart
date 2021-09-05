import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:passive/ui/passwords/passwords_bloc.dart';

class PasswordsPage extends StatelessWidget {
  final PasswordsBloc bloc = GetIt.instance.get();
  // TODO Handle loading and error state
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordsBloc, PasswordsViewState>(
      bloc: bloc,
      builder: (context, state) => Stack(
        children: [
          Visibility(
            visible: state.data != null,
            child: Container(
              child: Center(child: Text(state.data?.first.name ?? "")),
            ),
          ),
          Visibility(
            visible: state.loading == true,
            child: Center(child: CircularProgressIndicator()),
          ),
          Visibility(
            visible: state.error != null,
            child: Column(), // TODO Finish
          )
        ],
      ),
    );
  }
}