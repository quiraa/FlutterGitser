import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/search/search_result.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/search_user_card.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/user_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case HomeErrorState:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error On Default : ${state.error!.message!}',
                  textAlign: TextAlign.center,
                ),
              ),
            );

          case HomeSuccessState:
            return HomeContent(
              listUsers: state.listUsers!,
              onUserClicked: (String username) {
                AppRouter.push(
                  context,
                  ScreenRoutes.detail,
                  arguments: username,
                );
                BlocProvider.of<DetailBloc>(context).add(
                  GetDetailUserEvent(username),
                );
              },
            );

          case SearchErrorState:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Error On Search : ${state.error!.message!}',
                  textAlign: TextAlign.center,
                ),
              ),
            );

          case SearchLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case SearchSuccessState:
            return SearchContent(
              searchResults: state.searchResponse!.items!,
              onUserClicked: (username) {
                BlocProvider.of<DetailBloc>(context).add(
                  GetDetailUserEvent(username),
                );
                BlocProvider.of<FollowersBloc>(context).add(
                  GetAllFollowersEvent(username),
                );
                AppRouter.push(
                  context,
                  ScreenRoutes.detail,
                  arguments: username,
                );
              },
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class HomeContent extends HookWidget {
  final List<UserResponseItem> listUsers;
  final void Function(String username) onUserClicked;

  HomeContent({
    Key? key,
    required this.listUsers,
    required this.onUserClicked,
  }) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: AvailableUserContent(
        listUsers: listUsers,
        onUserClicked: onUserClicked,
      ),
      floatingActionButton: _buildFavoriteFab(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 86.0,
      title: _buildSearchField(context),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(
              SearchUserEvent(_searchController.text.toString()),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        suffixIcon: IconButton(
          onPressed: () => _searchController.clear(),
          icon: const Icon(Icons.clear_rounded),
        ),
        hintText: 'Search Users',
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        filled: true,
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        BlocProvider.of<HomeBloc>(context).add(SearchUserEvent(value));
      },
    );
  }

  Widget _buildFavoriteFab(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      color: Theme.of(context).colorScheme.secondaryContainer,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          AppRouter.push(context, ScreenRoutes.favorite);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 8.0,
          ),
          child: Icon(Icons.star_rounded),
        ),
      ),
    );
  }
}

class SearchContent extends HookWidget {
  final List<SearchResult> searchResults;
  final void Function(String username) onUserClicked;

  SearchContent({
    Key? key,
    required this.searchResults,
    required this.onUserClicked,
  }) : super(key: key);

  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: AvailableSearchContent(
        searchResults: searchResults,
        onUserClicked: onUserClicked,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 86.0,
      surfaceTintColor: Colors.transparent,
      title: _buildSearchField(context),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16.0),
        prefixIcon: IconButton(
          onPressed: () {
            BlocProvider.of<HomeBloc>(context).add(
              SearchUserEvent(_searchController.text.toString()),
            );
          },
          icon: const Icon(Icons.search_rounded),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            _searchController.clear();
            BlocProvider.of<HomeBloc>(context).add(
              const GetAllUsersEvent(),
            );
          },
          icon: const Icon(Icons.clear_rounded),
        ),
        hintText: 'Search Users',
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        filled: true,
      ),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        BlocProvider.of<HomeBloc>(context).add(SearchUserEvent(value));
      },
    );
  }
}
