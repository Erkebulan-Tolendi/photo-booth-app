import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_booth_app/feature/pages/home_page/widgets/widgets.dart';

import '../../bloc/photo_bloc.dart';
import '../../bloc/photo_event.dart';
import '../../bloc/photo_state.dart';
import '../../models/photo.dart';

class HomePage extends StatelessWidget {
  int _photoIdCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Booth'),
        actions: [
          IconButton(
              onPressed: () async {
                final String? imagePath = await getImage();
                if (imagePath != null) {
                  final String photoId = (_photoIdCounter++).toString();
                  BlocProvider.of<PhotoListBloc>(context).add(
                    AddPhoto(photoPath: Photo(id: photoId, path: imagePath)),
                  );
                }
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: BlocBuilder<PhotoListBloc, PhotoListState>(
        builder: (context, state) {
          if (state is PhotoListInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PhotoListUpdated) {
            final List<Photo> photos = state.photos;
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final Photo photo = photos[index];
                return ListTileWid(photo: photo);
              },
            );
          } else {
            return Center(child: Text('No data'));
          }
        },
      ),
    );
  }

  Future<String?> getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    return pickedFile?.path;
  }
}
