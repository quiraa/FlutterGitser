import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_user_repos_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/detail/repository/repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GetUserReposUseCase getUserReposUseCase;

  RepositoryBloc(this.getUserReposUseCase)
      : super(const RepositoryLoadingState()) {
    on<GetUserRepositoriesEvent>(onGetUserRepositoriesEvent);
  }

  void onGetUserRepositoriesEvent(
    GetUserRepositoriesEvent event,
    Emitter<RepositoryState> emit,
  ) async {
    final state = await getUserReposUseCase(
      params: GetUserReposParams(event.username!),
    );

    if (state is DataSuccess) {
      emit(RepositorySuccessState(state.data!));
    }

    if (state is DataError) {
      emit(RepositoryErrorState(state.error!));
    }
  }
}
