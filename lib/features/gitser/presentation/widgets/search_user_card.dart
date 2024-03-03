import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_result.dart';

class AvailableSearchContent extends StatelessWidget {
  final List<SearchResult> searchResults;
  final void Function(String username)? onUserClicked;

  const AvailableSearchContent({
    Key? key,
    required this.searchResults,
    required this.onUserClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(
        bottom: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      itemCount: searchResults.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 8.0,
      ),
      itemBuilder: (context, index) {
        final SearchResult user = searchResults[index];
        return SearchUserCard(
          searchUser: user,
          onUserClicked: onUserClicked,
        );
      },
    );
  }
}

class SearchUserCard extends StatelessWidget {
  final SearchResult searchUser;
  final void Function(String username)? onUserClicked;

  const SearchUserCard({
    Key? key,
    required this.searchUser,
    required this.onUserClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          onUserClicked!(searchUser.login ?? '');
        },
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
              searchUser.avatar_url ?? '',
            ),
            child: searchUser.avatar_url != null
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
            searchUser.login ?? '',
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            'ID: ${searchUser.id ?? 0}',
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
