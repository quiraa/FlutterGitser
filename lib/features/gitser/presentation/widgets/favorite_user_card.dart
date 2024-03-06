import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';

class AvailableFavoriteContent extends StatelessWidget {
  final List<FavoriteUser> favorites;
  final void Function(String username) onUserClicked;
  final void Function(int userId) onFavoriteDeleted;

  const AvailableFavoriteContent({
    Key? key,
    required this.favorites,
    required this.onUserClicked,
    required this.onFavoriteDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: favorites.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8.0,
      ),
      itemBuilder: (context, index) {
        final FavoriteUser user = favorites[index];
        return FavoriteCard(
          favorite: user,
          onUserClicked: onUserClicked,
          onFavoriteDeleted: onFavoriteDeleted,
        );
      },
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final FavoriteUser favorite;
  final void Function(String username) onUserClicked;
  final void Function(int userId) onFavoriteDeleted;

  const FavoriteCard({
    Key? key,
    required this.favorite,
    required this.onUserClicked,
    required this.onFavoriteDeleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onUserClicked(favorite.username!),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: _buildImageBody(),
            ),
            Expanded(
              flex: 3,
              child: _buildInformationBody(),
            ),
            Expanded(
              child: IconButton(
                onPressed: () => onFavoriteDeleted(favorite.userId!),
                icon: Icon(
                  Icons.delete_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageBody() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
              favorite.photoUrl ?? '',
            ),
            child: favorite.photoUrl != null
                ? null
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Widget _buildInformationBody() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            favorite.username ?? '',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'ID: ${favorite.userId ?? 0}',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
