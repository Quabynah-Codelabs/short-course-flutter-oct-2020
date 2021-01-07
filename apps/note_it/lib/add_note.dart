import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/fab.dart';
import 'package:note_it/note.dart';
import 'package:note_it/top_app_bar.dart';
import 'package:random_color/random_color.dart';
import 'package:uuid/uuid.dart';

class AddNotePage extends StatefulWidget {
  final Note note;

  const AddNotePage({Key key, this.note}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  /// saves the loading state of  new note
  bool _isLoading = false;

  /// get instance of notes box
  final _notesBox = Hive.box<Note>(kNotesBox);

  /// form fields
  final _titleController = TextEditingController(),
      _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// validate the form, create a new note & return data to previous page
  void _saveNote() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      var note = widget.note == null
          ? Note(
              id: Uuid().v4(),
              title: _titleController.text?.trim(),
              body: _bodyController.text.trim(),
              color: RandomColor()
                  .randomColor(
                    colorBrightness: ColorBrightness.veryLight,
                  )
                  .value,
              createdAt: DateTime.now().toIso8601String(),
            )
          : widget.note.copyWith(
              title: _titleController.text?.trim(),
              body: _bodyController.text.trim(),
            );

      setState(() {
        _isLoading = true;
      });

      /// save to box
      _notesBox.put(note.id, note);

      /// simulate delay
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        _isLoading = false;
      });

      /// send note to previous page
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    super.initState();

    if (mounted) {
      _bodyController.text = widget.note.body;
      _titleController.text = widget.note.title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            /// content
            Positioned.fill(
              left: 24,
              right: 24,
              top: kToolbarHeight,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    /// title
                    TextFormField(
                      controller: _titleController,
                      validator: (input) =>
                          input.isEmpty ? "This is required" : null,
                      decoration: InputDecoration(
                        hintText: "Title",
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),

                    SizedBox(height: 16),

                    /// body
                    TextFormField(
                      controller: _bodyController,
                      validator: (input) =>
                          input.isEmpty ? "This is required" : null,
                      decoration: InputDecoration(
                        hintText: "Body",
                      ),
                      maxLines: 5,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ],
                ),
              ),
            ),

            /// top app bar
            Positioned(
              top: 0,
              child: TopAppBar(
                title: "Create note",
                navIcon: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),

            /// FAB
            Positioned(
              bottom: 16,
              right: 16,
              child: NoteFAB(
                icon: Icons.save,
                onTap: _saveNote,
                isLoading: _isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
