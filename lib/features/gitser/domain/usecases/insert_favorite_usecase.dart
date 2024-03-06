import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class InsertFavoriteUseCase implements UseCase<void, FavoriteUser> {
  final Repository repository;

  InsertFavoriteUseCase(this.repository);

  @override
  Future<void> call({FavoriteUser? params}) {
    return repository.insertFavorite(params!);
  }
}
