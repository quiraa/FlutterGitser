import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_followers_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/followers/followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  final GetUserFollowersUseCase getUserFollowersUseCase;

  FollowersBloc(this.getUserFollowersUseCase)
      : super(const FollowersLoadingState()) {
    on<GetAllFollowersEvent>(onGetAllFollowersEvent);
  }

  void onGetAllFollowersEvent(
    GetAllFollowersEvent event,
    Emitter<FollowersState> emit,
  ) async {
    final state = await getUserFollowersUseCase(
      params: GetUserFollowersParams(event.username!),
    );

    if (state is DataSuccess) {
      emit(FollowersSuccessState(state.data!));
    }

    if (state is DataError) {
      emit(FollowersErrorState(state.error!));
    }
  }
}
