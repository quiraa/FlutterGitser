import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';

abstract class FavoriteEvent {
  final FavoriteUser? favorite;
  final int? userId;

  const FavoriteEvent({this.favorite, this.userId});
}

class GetAllFavoriteEvent extends FavoriteEvent {
  const GetAllFavoriteEvent();
}

class AddToFavoriteEvent extends FavoriteEvent {
  const AddToFavoriteEvent(FavoriteUser favorite) : super(favorite: favorite);
}

class DeleteAllFavoriteEvent extends FavoriteEvent {
  const DeleteAllFavoriteEvent();
}

class RemoveFavoriteEvent extends FavoriteEvent {
  const RemoveFavoriteEvent(int userId) : super(userId: userId);
}

class CheckFavoriteEvent extends FavoriteEvent {
  const CheckFavoriteEvent(int userId) : super(userId: userId);
}
