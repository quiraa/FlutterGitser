import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/di/injection.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/favorite_user_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injection<FavoriteBloc>()
        ..add(
          const GetAllFavoriteEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () => AppRouter.pop(context),
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
          ),
          centerTitle: true,
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FavoriteEmptyState:
            return const Center(
              child: Text(
                'Empty Favorite',
              ),
            );

          case FavoriteLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case FavoriteSuccessState:
            if (state.favoriteUsers!.isNotEmpty) {
              return FavoriteContent(
                favorites: state.favoriteUsers!,
                onFavoriteDeleted: (userId) {
                  BlocProvider.of<FavoriteBloc>(context).add(
                    RemoveFavoriteEvent(userId),
                  );
                },
                onUserClicked: (username) {
                  AppRouter.push(
                    context,
                    ScreenRoutes.detail,
                    arguments: username,
                  );
                },
              );
            } else {
              return const Center(
                child: Text(
                  'Empty Favorite',
                ),
              );
            }

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class FavoriteContent extends StatelessWidget {
  final List<FavoriteUser> favorites;
  final void Function(String username) onUserClicked;
  final void Function(int userId) onFavoriteDeleted;

  const FavoriteContent({
    Key? key,
    required this.favorites,
    required this.onUserClicked,
    required this.onFavoriteDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: _buildDeleteAllFab(context),
    );
  }

  Widget _buildBody() {
    switch (favorites.isNotEmpty) {
      case true:
        return AvailableFavoriteContent(
          favorites: favorites,
          onUserClicked: onUserClicked,
          onFavoriteDeleted: onFavoriteDeleted,
        );
      case false:
        return const Center(
          child: Text(
            'Empty Favorites',
          ),
        );
    }
  }

  Widget _buildDeleteAllFab(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => BlocProvider.of<FavoriteBloc>(context).add(
        const DeleteAllFavoriteEvent(),
      ),
      child: Icon(
        Icons.delete_forever_rounded,
        color: Theme.of(context).colorScheme.error,
      ),
    );
  }
}
