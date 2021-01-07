import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_it/fab.dart';
import 'package:note_it/note.dart';
import 'package:note_it/top_app_bar.dart';

class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  /// saves the loading state of  new note
  bool _isLoading = false;

  /// form fields
  final _titleController = TextEditingController(),
      _bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  /// validate the form, create a new note & return data to previous page
  void _saveNote() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      var random = Random().nextInt(6);
      var note = Note(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text?.trim(),
        body: _bodyController.text.trim(),
        color: Colors.primaries[random].value,
        createdAt: DateTime.now().toIso8601String(),
      );
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 3));
      setState(() {
        _isLoading = false;
      });

      /// send note to previous page
      Navigator.of(context).pop(note);
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
