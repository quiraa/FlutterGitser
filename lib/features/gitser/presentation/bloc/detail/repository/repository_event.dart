abstract class RepositoryEvent {
  final String? username;
  const RepositoryEvent({this.username});
}

class GetUserRepositoriesEvent extends RepositoryEvent {
  const GetUserRepositoriesEvent(String username) : super(username: username);
}
