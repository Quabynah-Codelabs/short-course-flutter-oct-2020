import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<Note> _notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            /// content
            NoteListView(notes: _notes, showAsGrid: true),

            /// app bar
            TopAppBar(title: kAppName),

            /// FAB
            Positioned(
              bottom: 16,
              right: 16,
              child: NoteFAB(
                icon: Icons.article_outlined,
                onTap: () async {
                  final note =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => AddNotePage(),
                  ));

                  if (note is Note && note != null) {
                    _notes.add(note);
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// load notes from a data source
  void _loadNotes() async {
    /// fetch sample notes data as json
    var jsonSource = await rootBundle.loadString(kPathToNotes);

    /// decode the json file as a list of dynamic objects
    var decodedJson = jsonDecode(jsonSource) as List;

    for (var item in decodedJson) {
      /// deserialize item
      final note = Note.fromJson(item);
      _notes.add(note);
    }

    /// notify UI of changes
    setState(() {});
  }
}
