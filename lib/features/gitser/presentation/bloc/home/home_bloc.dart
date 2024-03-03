import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gitser/core/resources/data_state.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/get_users_usecase.dart';
import 'package:flutter_gitser/features/gitser/domain/usecases/search_users_usecase.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_event.dart';
import 'package:flutter_gitser/features/gitser/presentation/bloc/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase getUsersUseCase;
  final SearchUsersUseCase searchUsersUseCase;

  HomeBloc(this.getUsersUseCase, this.searchUsersUseCase)
      : super(const HomeLoadingState()) {
    on<GetAllUsersEvent>(onGetAllUsersEvent);
    on<SearchUserEvent>(onSearchUsersEvent);
  }

  void onGetAllUsersEvent(
    GetAllUsersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());

    final state = await getUsersUseCase();

    if (state is DataSuccess) {
      emit(HomeSuccessState(state.data!));
    }

    if (state is DataError) {
      emit(HomeErrorState(state.error!));
    }
  }

  void onSearchUsersEvent(
    SearchUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const SearchLoadingState());
    final state = await searchUsersUseCase(
      params: SearchUsersParams(
        // authorization: Constants.token,
        query: event.query,
      ),
    );

    if (state is DataSuccess) {
      emit(SearchSuccessState(state.data!));
    }

    if (state is DataError) {
      emit(SearchErrorState(state.error!));
    }
  }
}
