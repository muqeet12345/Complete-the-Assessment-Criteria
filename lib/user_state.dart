 import 'package:untitled4/user.dart';

abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<User> users;
  UsersLoadedState({required this.users});
}

class UsersErrorState extends UsersState {
  final String message;
  UsersErrorState({required this.message});
}
