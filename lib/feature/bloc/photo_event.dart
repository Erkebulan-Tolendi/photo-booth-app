import '../models/photo.dart';

abstract class PhotoListEvent {}

class LoadPhotos extends PhotoListEvent {}

class AddPhoto extends PhotoListEvent {
  final Photo photoPath;

  AddPhoto({required this.photoPath});
}

class DeletePhoto extends PhotoListEvent {
  final Photo photoPath;

  DeletePhoto({required this.photoPath});
}
