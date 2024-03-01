import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class DetailUserUseCase
    implements UseCase<DataState<DetailResponse>, DetailUserParams> {
  final Repository repository;

  DetailUserUseCase(this.repository);

  @override
  Future<DataState<DetailResponse>> call({DetailUserParams? params}) {
    return repository.getUserDetail(params!.username);
  }
}

class DetailUserParams {
  final String username;
  DetailUserParams(this.username);
}
