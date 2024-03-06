import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_gitser/core/constants/constants.dart';
import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_response.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/data/sources/local/app_database.dart';
import 'package:flutter_gitser/features/gitser/data/sources/remote/api_service.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final ApiService api;
  final AppDatabase database;

  RepositoryImpl(this.api, this.database);

  @override
  Future<DataState<List<UserResponseItem>>> getAllUsers() async {
    try {
      final listUsers = await api.getAllUsers(Constants.token);

      if (listUsers.response.statusCode == HttpStatus.ok) {
        return DataSuccess(listUsers.data);
      } else {
        return DataError(
          DioException(
            error: listUsers.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: listUsers.response,
            requestOptions: listUsers.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  @override
  Future<DataState<DetailResponse>> getUserDetail(String username) async {
    try {
      final userDetail = await api.getDetailUserResponse(
        Constants.token,
        username,
      );

      if (userDetail.response.statusCode == HttpStatus.ok) {
        return DataSuccess(userDetail.data);
      } else {
        return DataError(
          DioException(
            error: userDetail.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: userDetail.response,
            requestOptions: userDetail.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  @override
  Future<DataState<List<UserResponseItem>>> getUserFollowers(
    String username,
  ) async {
    try {
      final followers = await api.getUserFollowers(
        Constants.token,
        username,
      );

      if (followers.response.statusCode == HttpStatus.ok) {
        return DataSuccess(followers.data);
      } else {
        return DataError(
          DioException(
            error: followers.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: followers.response,
            requestOptions: followers.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  @override
  Future<DataState<List<UserResponseItem>>> getUserFollowing(
    String username,
  ) async {
    try {
      final following = await api.getUserFollowing(
        Constants.token,
        username,
      );

      if (following.response.statusCode == HttpStatus.ok) {
        return DataSuccess(following.data);
      } else {
        return DataError(
          DioException(
            error: following.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: following.response,
            requestOptions: following.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  @override
  Future<DataState<SearchResponse>> searchUserByUsername(
    String username,
  ) async {
    try {
      final search = await api.searchUserByUsername(
        Constants.token,
        username,
      );

      if (search.response.statusCode == HttpStatus.ok) {
        return DataSuccess(search.data);
      } else {
        return DataError(
          DioException(
            error: search.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: search.response,
            requestOptions: search.response.requestOptions,
          ),
        );
      }
    } on DioException catch (error) {
      return DataError(error);
    }
  }

  @override
  Future<void> deleteAllFavorite() async {
    return database.dao.deleteAllFavorite();
  }

  @override
  Future<void> deleteFavorite(int userId) async {
    return database.dao.deleteFavorite(userId);
  }

  @override
  Future<List<FavoriteUser>> getAllFavorites() async {
    return database.dao.getAllFavoriteUsers();
  }

  @override
  Future<void> insertFavorite(FavoriteUser favorite) async {
    return database.dao.insertUserToFavorite(favorite);
  }
}
