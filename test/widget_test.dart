import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:photo_booth_app/feature/bloc/photo_bloc.dart';
import 'package:photo_booth_app/feature/bloc/photo_state.dart';
import 'package:photo_booth_app/feature/models/photo.dart';
import 'package:photo_booth_app/feature/pages/home_page/home_page.dart';

class MockPhotoListBloc extends Mock implements PhotoListBloc {}

void main() {
  group('HomePage', () {
    late MockPhotoListBloc mockBloc;

    setUp(() {
      mockBloc = MockPhotoListBloc();
    });

    testWidgets('Renders CircularProgressIndicator when bloc state is initial',
        (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(PhotoListInitial(photos: []));

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: HomePage(),
        ),
      ));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders ListView.builder when bloc state is updated',
        (WidgetTester tester) async {
      when(mockBloc.state).thenReturn(
        PhotoListUpdated(photos: [Photo(id: '1', path: 'path1')]),
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: HomePage(),
        ),
      ));

      await tester.pump();

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
    });
  });
}
