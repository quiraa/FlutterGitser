import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';

abstract class DetailState {
  final DetailResponse? response;
  final DioException? error;

  const DetailState({this.error, this.response});
}

class DetailLoadingState extends DetailState {
  const DetailLoadingState();
}

class DetailErrorState extends DetailState {
  const DetailErrorState(DioException error) : super(error: error);
}

class DetailSuccessState extends DetailState {
  const DetailSuccessState(DetailResponse response) : super(response: response);
}
