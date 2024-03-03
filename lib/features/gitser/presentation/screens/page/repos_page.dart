import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/repository_response.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_state.dart';
import 'package:flutter_gitser/features/gitser/presentation/widgets/repository_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReposPage extends HookWidget {
  final String username;

  const ReposPage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RepositoryBloc>(context).add(
      GetUserRepositoriesEvent(username),
    );
    return Scaffold(
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<RepositoryBloc, RepositoryState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case RepositoryLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case RepositoryErrorState:
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(state.error!.message!),
              ),
            );

          case RepositorySuccessState:
            return ReposContent(repos: state.response!);
          default:
            return const SizedBox();
        }
      },
    );
  }
}

class ReposContent extends StatelessWidget {
  final List<RepositoryResponse> repos;

  const ReposContent({
    Key? key,
    required this.repos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (repos.isNotEmpty) {
      case true:
        return AvailableRepositoryContent(
          repos: repos,
        );

      case false:
        return const SizedBox();
    }
  }
}
