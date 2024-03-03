import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/user_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FollowersPage extends HookWidget {
  final String username;

  const FollowersPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FollowersBloc>(context).add(
      GetAllFollowersEvent(username),
    );
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<FollowersBloc, FollowersState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FollowersLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case FollowersErrorState:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(state.error!.message!),
              ),
            );

          case FollowersSuccessState:
            return FollowersContent(
              followers: state.response!,
              onFollowersClicked: (username) {
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

          default:
            return const SizedBox();
        }
      },
    );
  }
}

class FollowersContent extends StatelessWidget {
  final List<UserResponseItem> followers;
  final void Function(String username) onFollowersClicked;

  const FollowersContent({
    Key? key,
    required this.followers,
    required this.onFollowersClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (followers.isNotEmpty) {
      case true:
        return AvailableUserContent(
          listUsers: followers,
          onUserClicked: onFollowersClicked,
        );
      case false:
        return const SizedBox();
    }
  }
}
