import 'package:flutter_gitser/core/usecases/usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/repository/repository.dart';

class DeleteAllFavoriteUseCase implements UseCase<void, void> {
  final Repository repository;

  DeleteAllFavoriteUseCase(this.repository);

  @override
  Future<void> call({void params}) {
    return repository.deleteAllFavorite();
  }
}
