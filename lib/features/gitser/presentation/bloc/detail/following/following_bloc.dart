import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_following_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/following/following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final GetUserFollowingUseCase getUserFollowingUseCase;

  FollowingBloc(this.getUserFollowingUseCase)
      : super(const FollowingLoadingState()) {
    on<GetAllFollowingEvent>(onGetAllFollowingEvent);
  }

  void onGetAllFollowingEvent(
    GetAllFollowingEvent event,
    Emitter<FollowingState> emit,
  ) async {
    final state = await getUserFollowingUseCase(
        params: GetUserFollowingParams(event.username!));

    if (state is DataSuccess) {
      emit(FollowingSuccessState(state.data!));
    }

    if (state is DataError) {
      emit(FollowingErrorState(state.error!));
    }
  }
}
