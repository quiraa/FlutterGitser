abstract class FollowingEvent {
  final String? username;

  const FollowingEvent({this.username});
}

class GetAllFollowingEvent extends FollowingEvent {
  const GetAllFollowingEvent(String username) : super(username: username);
}
