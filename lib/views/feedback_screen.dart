import 'package:easy_class/db/db_helper.dart';
import 'package:easy_class/mixins/question_mixins.dart';
import 'package:easy_class/models/feedback.dart';
import 'package:easy_class/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';

class FeedbackScreen extends StatefulWidget {
  final List<QuizQuestion> questions;

  const FeedbackScreen({
    super.key,
    required this.questions,
  });

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> with QuestionMixins {
  DatabaseHelper databaseHelper = DatabaseHelper();

  Future<int> safeFeedback(String feedback) async {
    var dbClient = await databaseHelper.db;
    return await dbClient.insert(
        TableNames.feedBack,
        MyFeedback(time: DateTime.now().toString(), feedback: feedback)
            .toJson());
  }

  String feedBackText = "";

  Future<void> getFeedback() async {
    await askAnalyse(widget.questions).then((value) {
      setState(() {
        feedBackText = value ?? "";
      });
    });
  }

  @override
  void initState() {
    getFeedback();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz complited"),
      ),
      body: FutureBuilder(
        future: askAnalyse(widget.questions),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Lottie.asset("assets/json/loading.json"),
            );
          } else {
            // return SingleChildScrollView(child: Text(snapshot.data ?? ""));
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(
                  data: feedBackText
                      .replaceAll("```html", "")
                      .replaceAll("```", ""),
                  style: {
                    "body": Style(),
                  },
                ),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Boshqa mavzu"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Qayta ishga tushirish",
                ))
          ],
        ),
      ),
    );
  }
}
