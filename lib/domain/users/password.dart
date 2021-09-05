import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String name;

  Password(this.name);

  @override
  List<Object?> get props => [name];

}