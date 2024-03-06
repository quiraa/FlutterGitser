import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/delete_all_favorite_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_all_favorite_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/insert_favorite_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/remove_favorite_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final DeleteAllFavoriteUseCase deleteAllFavoriteUseCase;
  final InsertFavoriteUseCase insertFavoriteUseCase;
  final RemoveFavoriteUseCase removeFavoriteUseCase;
  final GetAllFavoriteUseCase getAllFavoriteUseCase;

  FavoriteBloc(
    this.deleteAllFavoriteUseCase,
    this.getAllFavoriteUseCase,
    this.insertFavoriteUseCase,
    this.removeFavoriteUseCase,
  ) : super(const FavoriteLoadingState()) {
    on<DeleteAllFavoriteEvent>(onDeleteAllFavorite);
    on<AddToFavoriteEvent>(onAddFavorite);
    on<RemoveFavoriteEvent>(onRemoveFavorite);
    on<GetAllFavoriteEvent>(onGetAllFavorite);
    on<CheckFavoriteEvent>(onCheckFavorite);
  }

  void onGetAllFavorite(
    GetAllFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(const FavoriteLoadingState());
    final favorites = await getAllFavoriteUseCase();
    emit(FavoriteSuccessState(favorites));
  }

  void onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    await removeFavoriteUseCase(params: RemoveFavoriteParams(event.userId!));
    final currentFavorites = await getAllFavoriteUseCase();
    emit(const FavoriteLoadingState());
    emit(FavoriteSuccessState(currentFavorites));
    add(CheckFavoriteEvent(event.userId!));
    add(const GetAllFavoriteEvent());
  }

  void onAddFavorite(
    AddToFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    await insertFavoriteUseCase(params: event.favorite!);
    final currentFavorites = await getAllFavoriteUseCase();
    emit(FavoriteSuccessState(currentFavorites));
    add(CheckFavoriteEvent(event.favorite!.userId!));
  }

  void onCheckFavorite(
    CheckFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    final allFavorites = await getAllFavoriteUseCase();
    final isFavorite =
        allFavorites.any((favorites) => favorites.userId == event.userId);
    if (isFavorite) {
      emit(const FavoritedState());
    } else {
      emit(const NotFavoritedState());
    }
  }

  void onDeleteAllFavorite(
    DeleteAllFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    await deleteAllFavoriteUseCase();
    final currentFavorites = await getAllFavoriteUseCase();
    emit(FavoriteSuccessState(currentFavorites));
  }
}
