import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';

abstract class FollowingState {
  final List<UserResponseItem>? response;
  final DioException? error;

  const FollowingState({
    this.error,
    this.response,
  });
}

class FollowingLoadingState extends FollowingState {
  const FollowingLoadingState();
}

class FollowingErrorState extends FollowingState {
  const FollowingErrorState(DioException error) : super(error: error);
}

class FollowingSuccessState extends FollowingState {
  const FollowingSuccessState(List<UserResponseItem> response)
      : super(response: response);
}
