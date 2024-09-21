import 'package:easy_class/models/data_model.dart';
import 'package:easy_class/views/books_screen/book_lessons.dart';
import 'package:easy_class/views/quiz_screen.dart';

import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  final BookModel? dataModel;

  const BookDetail({super.key, required this.dataModel});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00bac7),
        title: Text(
          widget.dataModel?.bookName ?? "",
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                children: [
                  for (int i = 0;
                      i < (widget.dataModel?.classes.length ?? 0);
                      i++)
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookLessons(
                                      dataModel: widget.dataModel?.classes[i],
                                    )));
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${widget.dataModel?.classes[i].classLevel.toString() ?? ""}\nsinf",
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuizScreen(),
                    ));
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(
                        "assets/svg_icon/img_1.png",
                        width: 150,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Ixtiyoriy mavzuda \ntest tuzish!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
