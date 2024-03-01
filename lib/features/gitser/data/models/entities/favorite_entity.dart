import 'package:floor/floor.dart';

@Entity(tableName: 'favorite')
class FavoriteUser {
  @PrimaryKey()
  final int? userId;

  @ColumnInfo(name: 'photo')
  final String? photoUrl;

  @ColumnInfo(name: 'username')
  final String? username;

  FavoriteUser(this.userId, this.photoUrl, this.username);
}
