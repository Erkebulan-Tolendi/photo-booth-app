import 'package:flutter_bloc/flutter_bloc.dart';

import 'photo_event.dart';
import 'photo_state.dart';

class PhotoListBloc extends Bloc<PhotoListEvent, PhotoListState> {
  PhotoListBloc() : super(PhotoListInitial(photos: [])) {
    on<AddPhoto>(_addPhoto);
    on<DeletePhoto>(_deletePhoto);
  }

  void _addPhoto(AddPhoto event, Emitter<PhotoListState> emit) {
    state.photos.add(event.photoPath);
    emit(PhotoListUpdated(photos: state.photos));
  }

  void _deletePhoto(DeletePhoto event, Emitter<PhotoListState> emit) {
    state.photos.remove(event.photoPath);
    emit(PhotoListUpdated(photos: state.photos));
  }
}
