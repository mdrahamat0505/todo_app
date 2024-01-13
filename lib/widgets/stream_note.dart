import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_appp/widgets/task_widgets.dart';

import '../data/firestor.dart';

class StreamNote extends StatefulWidget {
  bool done;
  StreamNote(this.done, {super.key});

  @override
  State<StreamNote> createState() => _StreamNoteState();
}

class _StreamNoteState extends State<StreamNote> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreDatasource().stream(widget.done),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(


                child: CircularProgressIndicator());
          }
          final _noteslist = FirestoreDatasource().getNotes(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _noteslist.length,

            itemBuilder: (context, index) {
              // final note = noteslist[index];
              return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    FirestoreDatasource().delet_note(_noteslist[index].id);
                  },
                  child: TaskWidget(_noteslist[index]));
            },
          );
        },);
  }
}
