import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_it/app.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/note.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initApp();

  runApp(NoteApp());
}

Future<void> _initApp() async {
  /// initialize hive
  await Hive.initFlutter();

  /// register adapter for hive to work with box
  Hive.registerAdapter(NoteAdapter());

  /// open box
  await Hive.openBox<Note>(kNotesBox);

  /// get instance of shared preferences
  var prefs = await SharedPreferences.getInstance();

  /// get sample data load state ["should_load_data" : false]
  var shouldAddData = prefs.getBool(kLoadDataKey) ?? true;

  if (shouldAddData) {
    /// fetch sample notes data as json
    var jsonSource = await rootBundle.loadString(kPathToNotes);

    /// decode the json file as a list of dynamic objects
    var decodedJson = jsonDecode(jsonSource) as List;

    /// get instance of notes box
    var notesBox = Hive.box<Note>(kNotesBox);

    for (var item in decodedJson) {
      /// deserialize item
      final note = Note.fromJson(item);
      notesBox.put(note.id, note);
    }

    await prefs.setBool(kLoadDataKey, false);
  }
}
