abstract class FollowersEvent {
  final String? username;
  const FollowersEvent({this.username});
}

class GetAllFollowersEvent extends FollowersEvent {
  const GetAllFollowersEvent(String username) : super(username: username);
}
