abstract class RemoteWordImagesEvent {
  const RemoteWordImagesEvent();
}

class GetWordImagesEvent extends RemoteWordImagesEvent {
  final String word;

  const GetWordImagesEvent({required this.word});
}