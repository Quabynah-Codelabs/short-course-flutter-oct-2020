import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_it/add_note.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/fab.dart';
import 'package:note_it/note.dart';
import 'package:note_it/note_list_view.dart';
import 'package:note_it/top_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// content
            ValueListenableBuilder(
              valueListenable: Hive.box<Note>(kNotesBox).listenable(),
              builder: (_, Box<Note> box, __) {
                var notes = box.values.toList();
                return NoteListView(notes: notes, showAsGrid: true);
              },
            ),

            /// app bar
            TopAppBar(title: kAppName),

            /// FAB
            Positioned(
              bottom: 16,
              right: 16,
              child: NoteFAB(
                icon: Icons.article_outlined,
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddNotePage(),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
