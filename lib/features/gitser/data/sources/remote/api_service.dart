import 'package:flutter_gitser/core/constants/constants.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('users')
  Future<HttpResponse<List<UserResponseItem>>> getAllUsers(
    @Header('Authorization') String authorization,
  );

  @GET('search/users')
  Future<HttpResponse<SearchResponse>> searchUserByUsername(
    @Query('q') String query,
  );

  @GET('users/{username}')
  Future<HttpResponse<DetailResponse>> getDetailUserResponse(
    @Path('username') String username,
  );

  @GET('users/{username}/followers')
  Future<HttpResponse<List<UserResponseItem>>> getUserFollowers(
    @Path('username') String username,
  );

  @GET('users/{username}/following')
  Future<HttpResponse<List<UserResponseItem>>> getUserFollowing(
    @Path('username') String username,
  );
}
