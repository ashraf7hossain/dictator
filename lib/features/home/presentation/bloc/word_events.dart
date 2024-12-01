abstract class RemoteWordEvent {
  const RemoteWordEvent();
}

class GetWordEvent extends RemoteWordEvent {
  final String word;

  const GetWordEvent({required this.word});
}
