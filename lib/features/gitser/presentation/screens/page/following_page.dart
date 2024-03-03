import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/config/routes/app_router.dart';
import 'package:flutter_gitser/config/routes/screen_routes.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/users/user_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/user_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FollowingPage extends HookWidget {
  final String username;

  const FollowingPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FollowingBloc>(context).add(
      GetAllFollowingEvent(username),
    );
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<FollowingBloc, FollowingState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case FollowingLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case FollowingErrorState:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(state.error!.message!),
              ),
            );

          case FollowingSuccessState:
            return FollowingContent(
              followings: state.response!,
              onFollowingClicked: (username) {
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

class FollowingContent extends StatelessWidget {
  final List<UserResponseItem> followings;
  final void Function(String username) onFollowingClicked;

  const FollowingContent({
    Key? key,
    required this.followings,
    required this.onFollowingClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (followings.isNotEmpty) {
      case true:
        return AvailableUserContent(
          listUsers: followings,
          onUserClicked: onFollowingClicked,
        );
      case false:
        return const SizedBox();
    }
  }
}
