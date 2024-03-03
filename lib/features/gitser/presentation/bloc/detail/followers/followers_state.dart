import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';

abstract class FollowersState {
  final List<UserResponseItem>? response;
  final DioException? error;

  const FollowersState({this.error, this.response});
}

class FollowersLoadingState extends FollowersState {
  const FollowersLoadingState();
}

class FollowersErrorState extends FollowersState {
  const FollowersErrorState(DioException error) : super(error: error);
}

class FollowersSuccessState extends FollowersState {
  const FollowersSuccessState(List<UserResponseItem> response)
      : super(response: response);
}
