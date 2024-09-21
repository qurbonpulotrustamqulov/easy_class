import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/books_screen/read_book_screen.dart';
import 'package:easy_class/views/most_quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookLessons extends StatefulWidget {
  final ClassModel? dataModel;

  const BookLessons({super.key, this.dataModel});

  @override
  State<BookLessons> createState() => _BookLessonsState();
}

class _BookLessonsState extends State<BookLessons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00bac7),
        title: Text(
          "${widget.dataModel?.classLevel.toString() ?? ""}- sinf darsligi",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int i = 0; i < (widget.dataModel?.mundarija.length ?? 0); i++)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Text(
                              widget.dataModel?.mundarija[i].title.trim() ?? "",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ReadBookScreen(
                                        text: widget
                                                .dataModel?.mundarija[i].desc
                                                ?.trim() ??
                                            "",
                                        title: widget
                                                .dataModel?.mundarija[i].title
                                                .trim() ??
                                            ""),
                                  ));
                            },
                            icon: const Icon(
                              CupertinoIcons.book,
                              color: Colors.blue,
                            )),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreenM(
                                        responseText: widget
                                                .dataModel?.mundarija[i].desc
                                                ?.trim() ??
                                            "banana"),
                                  ));
                            },
                            icon: const Icon(
                              CupertinoIcons.question_circle,
                              color: Colors.blue,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    child: const Divider(),
                    width: MediaQuery.of(context).size.width * 0.6,
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
