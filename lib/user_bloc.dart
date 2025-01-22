import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';
import 'user.dart'; // Assume this is a model for User

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitialState()) {
    on<FetchUsersEvent>((event, emit) async {
      try {
        emit(UsersLoadingState());
        final users = await fetchUsersFromApi(); // API call
        emit(UsersLoadedState(users: users));
      } catch (e) {
        emit(UsersErrorState(message: e.toString()));
      }
    });
  }

  Future<List<User>> fetchUsersFromApi() async {
    // Replace with actual API call using Dio or HTTP
    await Future.delayed(Duration(seconds: 2)); // Simulate API delay
    return [
      User(name: 'John Doe', email: 'john.doe@example.com'),
      User(name: 'Jane Smith', email: 'jane.smith@example.com'),
    ];
  }
}
