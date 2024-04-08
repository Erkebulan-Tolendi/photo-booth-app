import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/photo_bloc.dart';
import '../../../bloc/photo_event.dart';
import '../../../models/photo.dart'; // Import your Photo model
import '../../photo_detail/photo_detail.dart';

class ListTileWid extends StatelessWidget {
  final Photo photo;

  const ListTileWid({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailPage(photo: photo),
          ),
        );
      },
      leading: Image.file(File(photo.path)),
      title: Text('Photo ${photo.id}'),
      subtitle: Text(photo.path),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          BlocProvider.of<PhotoListBloc>(context).add(
            DeletePhoto(photoPath: photo),
          );
        },
      ),
    );
  }
}
