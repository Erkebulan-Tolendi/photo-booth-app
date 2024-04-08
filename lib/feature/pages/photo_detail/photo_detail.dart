import 'dart:io';

import 'package:flutter/material.dart';

import '../../models/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.file(File(photo.path)),
            SizedBox(height: 20),
            Text('Photo ID: ${photo.id}'),
          ],
        ),
      ),
    );
  }
}
