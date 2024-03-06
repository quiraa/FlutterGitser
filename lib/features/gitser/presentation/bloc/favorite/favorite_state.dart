import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';

abstract class FavoriteState {
  final List<FavoriteUser>? favoriteUsers;
  final String? message;

  const FavoriteState({this.favoriteUsers, this.message});
}

class FavoriteLoadingState extends FavoriteState {
  const FavoriteLoadingState();
}

class FavoriteSuccessState extends FavoriteState {
  const FavoriteSuccessState(List<FavoriteUser> favoriteUsers)
      : super(favoriteUsers: favoriteUsers);
}

class FavoritedState extends FavoriteState {
  const FavoritedState();
}

class NotFavoritedState extends FavoriteState {
  const NotFavoritedState();
}

class FavoriteEmptyState extends FavoriteState {
  const FavoriteEmptyState();
}
