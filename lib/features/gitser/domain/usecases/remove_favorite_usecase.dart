import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class RemoveFavoriteUseCase implements UseCase<void, RemoveFavoriteParams> {
  final Repository repository;

  RemoveFavoriteUseCase(this.repository);

  @override
  Future<void> call({RemoveFavoriteParams? params}) {
    return repository.deleteFavorite(params!.userId);
  }
}

class RemoveFavoriteParams {
  final int userId;

  RemoveFavoriteParams(this.userId);
}
