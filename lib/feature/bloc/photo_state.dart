import '../models/photo.dart';

abstract class PhotoListState {
  List<Photo> photos;
  PhotoListState({required this.photos});
}

class PhotoListInitial extends PhotoListState {
  PhotoListInitial({required super.photos});
}

class PhotoListUpdated extends PhotoListState {
  PhotoListUpdated({required List<Photo> photos}) : super(photos: photos);
}
