import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';

abstract class HomeState {
  final List<UserResponseItem>? listUsers;
  final DioException? error;

  const HomeState({this.listUsers, this.error});
}

class HomeLoadingState extends HomeState {
  const HomeLoadingState();
}

class HomeErrorState extends HomeState {
  const HomeErrorState(DioException error) : super(error: error);
}

class HomeSuccessState extends HomeState {
  const HomeSuccessState(List<UserResponseItem> listUsers)
      : super(listUsers: listUsers);
}
