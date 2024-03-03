import 'package:dio/dio.dart';
import 'package:flutter_gitser/features/gitser/data/repository/repository_impl.dart';
import 'package:flutter_gitser/features/gitser/data/sources/remote/api_service.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/detail_user_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_followers_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_following_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_repos_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_users_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/search_users_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_bloc.dart';
import 'package:get_it/get_it.dart';

final injection = GetIt.instance;

Future<void> initializeDependency() async {
  injection.registerSingleton<Dio>(Dio());

  injection.registerSingleton<ApiService>(ApiService(injection()));

  injection.registerSingleton<Repository>(
    RepositoryImpl(injection()),
  );

  injection.registerSingleton<GetUsersUseCase>(
    GetUsersUseCase(injection()),
  );

  injection.registerSingleton<DetailUserUseCase>(
    DetailUserUseCase(injection()),
  );

  injection.registerSingleton<SearchUsersUseCase>(
    SearchUsersUseCase(injection()),
  );

  injection.registerSingleton<GetUserFollowersUseCase>(
    GetUserFollowersUseCase(injection()),
  );

  injection.registerSingleton<GetUserFollowingUseCase>(
    GetUserFollowingUseCase(injection()),
  );

  injection.registerSingleton<GetUserReposUseCase>(
    GetUserReposUseCase(injection()),
  );

  injection.registerFactory<HomeBloc>(
    () => HomeBloc(injection(), injection()),
  );

  injection.registerFactory<DetailBloc>(
    () => DetailBloc(injection()),
  );

  injection.registerFactory<FollowersBloc>(
    () => FollowersBloc(injection()),
  );

  injection.registerFactory<FollowingBloc>(
    () => FollowingBloc(injection()),
  );

  injection.registerFactory<RepositoryBloc>(
    () => RepositoryBloc(injection()),
  );
}
