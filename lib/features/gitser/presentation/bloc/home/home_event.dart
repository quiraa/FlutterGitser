abstract class HomeEvent {
  final String? query;

  const HomeEvent({this.query});
}

class GetAllUsersEvent extends HomeEvent {
  const GetAllUsersEvent();
}

class SearchUserEvent extends HomeEvent {
  const SearchUserEvent(String query) : super(query: query);
}
