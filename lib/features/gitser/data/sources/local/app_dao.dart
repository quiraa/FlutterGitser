import 'package:floor/floor.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';

@dao
abstract class AppDao {
  @Query('SELECT * FROM favorite ORDER BY username ASC')
  Future<List<FavoriteUser>> getAllFavoriteUsers();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUserToFavorite(FavoriteUser favorite);

  @Query('DELETE FROM favorite')
  Future<void> deleteAllFavorite();

  @Query('DELETE FROM favorite WHERE id = :userId')
  Future<void> deleteFavorite(int userId);
}
