import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';

abstract class HomeState {
  final List<UserResponseItem>? listUsers;
  final SearchResponse? searchResponse;
  final DioException? error;

  const HomeState({
    this.listUsers,
    this.error,
    this.searchResponse,
  });
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

class SearchSuccessState extends HomeState {
  const SearchSuccessState(SearchResponse searchResponse)
      : super(searchResponse: searchResponse);
}

class SearchErrorState extends HomeState {
  const SearchErrorState(DioException error) : super(error: error);
}

class SearchLoadingState extends HomeState {
  const SearchLoadingState();
}
