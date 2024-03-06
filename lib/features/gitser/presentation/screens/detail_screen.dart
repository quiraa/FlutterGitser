// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/themes/typography.dart';
import 'package:flutter_gitser/di/injection.dart';
import 'package:flutter_gitser/features/gitser/data/models/entities/favorite_entity.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/favorite/favorite_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/page/followers_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/page/following_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/favorite_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailScreen extends HookWidget {
  final String username;

  const DetailScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injection<DetailBloc>()
        ..add(
          GetDetailUserEvent(username),
        ),
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case DetailLoadingState:
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );

          case DetailErrorState:
            return Container(
              color: Colors.white,
              child: Center(
                child: Text(state.error!.message!),
              ),
            );

          case DetailSuccessState:
            return DetailContent(
              username: username,
              user: state.response!,
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class DetailContent extends StatefulWidget {
  final String username;
  final DetailResponse user;

  const DetailContent({
    Key? key,
    required this.user,
    required this.username,
  }) : super(key: key);

  @override
  _DetailContentState createState() => _DetailContentState();
}

class _DetailContentState extends State<DetailContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<FavoriteBloc>(context).add(
      CheckFavoriteEvent(widget.user.id ?? 0),
    );
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      floatingActionButton: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return _buildFavoriteFab(state);
        },
      ),
    );
  }

  Widget _buildFavoriteFab(FavoriteState state) {
    if (state is FavoritedState) {
      return FavoriteButton(
        isBookmark: true,
        onFabClick: () {
          BlocProvider.of<FavoriteBloc>(context).add(
            RemoveFavoriteEvent(widget.user.id ?? 0),
          );
        },
      );
    } else if (state is NotFavoritedState) {
      return FavoriteButton(
        isBookmark: false,
        onFabClick: () {
          final favorite = FavoriteUser(
            widget.user.id,
            widget.user.avatar_url,
            widget.user.login,
          );
          BlocProvider.of<FavoriteBloc>(context).add(
            AddToFavoriteEvent(favorite),
          );
          BlocProvider.of<FavoriteBloc>(context).add(
            const GetAllFavoriteEvent(),
          );
        },
      );
    } else {
      // Default state
      return FavoriteButton(
        isBookmark: false,
        onFabClick: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Null is Clicked'),
            ),
          );
        },
      );
    }
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Detail User'),
      leading: IconButton(
        onPressed: () {
          AppRouter.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildUserProfile(context),
        ),
        _buildTabBar(),
        Expanded(child: _buildTabScreen())
      ],
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: _buildUserAvatar(context),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 4,
          child: _buildInformation(context),
        ),
      ],
    );
  }

  Widget _buildUserAvatar(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          widget.user.avatar_url ?? '',
        ),
        child: widget.user.avatar_url != null
            ? null
            : const CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildInformation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.user.name ?? '',
          style: GitserTypography.detailName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          widget.user.login ?? '',
          style: GitserTypography.detailUsername,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          widget.user.company ?? '',
          style: GitserTypography.detailCompany,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          icon: const Icon(Icons.group_rounded),
          text: '${widget.user.followers} Followers',
        ),
        Tab(
          icon: const Icon(Icons.groups_2_rounded),
          text: '${widget.user.following} Following',
        ),
      ],
    );
  }

  Widget _buildTabScreen() {
    return TabBarView(
      controller: _tabController,
      children: [
        FollowersPage(
          username: widget.username,
        ),
        FollowingPage(
          username: widget.username,
        ),
      ],
    );
  }
}
