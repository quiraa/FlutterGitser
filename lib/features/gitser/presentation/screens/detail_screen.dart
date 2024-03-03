// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/themes/typography.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/detail_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/page/followers_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/page/following_page.dart';
import 'package:flutter_gitser/features/gitser/presentation/screens/page/repos_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailScreen extends HookWidget {
  final String? username;

  const DetailScreen({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              username: username!,
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
    );
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.redAccent,
            ),
          ),
        )
      ],
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
      tabs: const [
        Tab(
          icon: Icon(Icons.dashboard_rounded),
          text: 'Repositories',
        ),
        Tab(
          icon: Icon(Icons.group_rounded),
          text: 'Followers',
        ),
        Tab(
          icon: Icon(Icons.groups_2_rounded),
          text: 'Following',
        ),
      ],
    );
  }

  Widget _buildTabScreen() {
    return TabBarView(
      controller: _tabController,
      children: [
        ReposPage(
          username: widget.username,
        ),
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
