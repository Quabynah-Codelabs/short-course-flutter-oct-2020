import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_it/add_note.dart';
import 'package:note_it/constants.dart';
import 'package:note_it/note.dart';

class NoteListView extends StatelessWidget {
  final List<Note> notes;
  final bool showAsGrid;

  const NoteListView({
    Key key,
    this.notes = const [],
    this.showAsGrid = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    var kHeight = MediaQuery.of(context).size.height;

    return Container(
        width: kWidth,
        height: kHeight,
        padding: EdgeInsets.only(
          top: kToolbarHeight,
          left: 8,
          right: 8,
        ),
        child: showAsGrid
            ? GridView.builder(
                itemBuilder: (_, index) {
                  final noteItem = notes[index];
                  return NoteGridItem(noteItem: noteItem);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: notes.length,
              )
            : ListView.separated(
                itemBuilder: (_, index) {
                  final noteItem = notes[index];
                  return NoteListItem(noteItem: noteItem);
                },
                separatorBuilder: (_, __) => Divider(),
                itemCount: notes.length,
              ));
  }
}

/// Grid item for note
class NoteGridItem extends StatefulWidget {
  final Note noteItem;

  const NoteGridItem({Key key, this.noteItem}) : super(key: key);

  @override
  _NoteGridItemState createState() => _NoteGridItemState();
}

class _NoteGridItemState extends State<NoteGridItem> {
  final _notesBox = Hive.box<Note>(kNotesBox);

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddNotePage(
                  note: widget.noteItem,
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      kTheme.colorScheme.onBackground.withOpacity(kEmphasisLow),
                ),
                color: Color(widget.noteItem.color),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.noteItem.title,
                    style: kTheme.textTheme.headline6.copyWith(
                      decoration: widget.noteItem.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: widget.noteItem.completed
                          ? kTheme.colorScheme.onBackground
                              .withOpacity(kEmphasisLow)
                          : kTheme.colorScheme.onBackground,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.noteItem.body,
                    maxLines: 10,
                    overflow: TextOverflow.ellipsis,
                    style: kTheme.textTheme.bodyText1.copyWith(
                      decoration: widget.noteItem.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: widget.noteItem.completed
                          ? kTheme.colorScheme.onBackground
                              .withOpacity(kEmphasisLow)
                          : kTheme.colorScheme.onBackground,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 8,
          child: Checkbox(
            onChanged: (checked) async {
              var note = widget.noteItem.copyWith(completed: checked);
              await _notesBox.put(note.id, note);
            },
            value: widget.noteItem.completed,
          ),
        ),
      ],
    );
  }
}

/// List item for note
class NoteListItem extends StatefulWidget {
  final Note noteItem;

  const NoteListItem({Key key, @required this.noteItem}) : super(key: key);

  @override
  _NoteListItemState createState() => _NoteListItemState();
}

class _NoteListItemState extends State<NoteListItem> {
  Note _fakeNote;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _fakeNote = widget.noteItem;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return CheckboxListTile(
      tileColor: Color(_fakeNote.color),
      title: Text(
        _fakeNote.title,
        style: TextStyle(
          decoration: _fakeNote.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: _fakeNote.completed
              ? kTheme.colorScheme.onBackground.withOpacity(kEmphasisLow)
              : kTheme.colorScheme.onBackground,
        ),
      ),
      subtitle: Text(
        _fakeNote.body,
        style: TextStyle(
          decoration: _fakeNote.completed
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          color: _fakeNote.completed
              ? kTheme.colorScheme.onBackground.withOpacity(kEmphasisLow)
              : kTheme.colorScheme.onBackground,
        ),
      ),
      onChanged: (checked) {
        _fakeNote = _fakeNote.copyWith(completed: checked);
        setState(() {});
      },
      value: _fakeNote.completed,
    );
  }
}
