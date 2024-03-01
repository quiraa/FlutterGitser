abstract class DetailEvent {
  final String? username;
  const DetailEvent({this.username});
}

class GetDetailUserEvent extends DetailEvent {
  const GetDetailUserEvent(String username) : super(username: username);
}
