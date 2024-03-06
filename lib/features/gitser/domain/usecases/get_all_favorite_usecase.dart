import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class GetAllFavoriteUseCase implements UseCase<List<FavoriteUser>, void> {
  final Repository repository;

  GetAllFavoriteUseCase(this.repository);

  @override
  Future<List<FavoriteUser>> call({void params}) {
    return repository.getAllFavorites();
  }
}
