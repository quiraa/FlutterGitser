import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_bloc.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/detail_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailPage extends HookWidget {
  final String? username;

  const DetailPage({
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
            return Center(
              child: Text(state.response!.login!),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
