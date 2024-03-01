import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class GetUsersUseCase
    implements UseCase<DataState<List<UserResponseItem>>, void> {
  final Repository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<DataState<List<UserResponseItem>>> call({void params}) {
    return repository.getAllUsers();
  }
}
