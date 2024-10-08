import 'package:easy_class/models/quiz_question.dart';
import 'package:easy_class/views/feedback_screen.dart';
import 'package:flutter/material.dart';
import '../mixins/question_mixins.dart';

class QuestionsWidget extends StatefulWidget {
   final List<QuizQuestion> questions;
   const QuestionsWidget({
    super.key,
    required this.questions,
  });

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> with QuestionMixins {
  int _selectedValue = 0;

  @override
  void initState() {
    isDoneTest = List.generate(widget.questions.length, (index) => false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
        widget.questions.length,
        (index) {
          return isDoneTest[index] == true
              ? Container()
              : Container(
                  height: MediaQuery.of(context).size.height -235,
                  color: const Color(0xffF8F5FE),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.questions[index].question ?? "",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 25,),
                      // Text(widget.questions[index].correctAnswer ?? ""),
                      Column(
                        children: List.generate(4, (index4) {
                          return RadioListTile(
                            title: Text(
                                widget.questions[index].options?[index4] ?? ""),
                            value: index4 + 1,
                            groupValue: _selectedValue,
                            onChanged: (value) {
                              setState(() {
                                _selectedValue = value!;
                                widget.questions[index].userAnswer =
                                    widget.questions[index].options?[index4];
                                setState(() {});
                                debugPrint(widget.questions[index].userAnswer);
                              });
                            },
                          );
                        }),
                      ),
                      const SizedBox(height: 30,),
                      Container(
                        height: 60,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: widget.questions[index].userAnswer == null
                              ? Colors.grey
                              : const Color(0xffF19D38),
                        ),
                        child: InkWell(
                          onTap: () {
                            {
                              if (widget.questions[index].userAnswer != null) {
                                isDoneTest[index] = true;
                                _selectedValue = 0;
                                debugPrint("$isDoneTest");
                              }
                              if (isDoneTest
                                  .every((element) => element == true)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FeedbackScreen(
                                      questions: widget.questions,
                                    ),
                                  ),
                                );
                              }
                            }

                            setState(() {});
                          },
                          child: const Center(child: Text("Keyingi", style: TextStyle(fontSize: 18),)),
                        ),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
