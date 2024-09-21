import 'package:easy_class/mixins/question_mixins.dart';
import 'package:easy_class/views/doc_screen.dart';
import 'package:easy_class/views/pdf_screen.dart';
import 'package:easy_class/widgets/questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with QuestionMixins {
  String responseText = "";
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Easy Class"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller,
                maxLines: null,
                onChanged: (v) {
                  // responseText = v;
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: "Enter topic",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (controller.text != "") {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Lottie.asset("assets/json/loading.json"),
                              );
                            });
                        await askQuestion(controller.text)
                            .then((value) {
                          responseText = value!;
                          Navigator.pop(context);
                          debugPrint("\n\n\n$responseText\n\n\n");
                          FocusNode().unfocus();
                          isDoneTest = List.generate(5, (index) => false);
                          setState(() {});
                        });
                      }
                    },
                    icon: Icon(
                      Icons.send,
                      color: controller.text != ""
                          ? const Color(0xffF19D38)
                          : Colors.grey,
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              responseText == ""
                  ? noDataWidget
                  : QuestionsWidget(
                      questions: parseQuizQuestions(responseText
                          .replaceAll("```json", "")
                          .replaceAll("```", "")
                      ),
                    ),
              const Spacer(),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => FileCreationPage(text: "jkhkshdcksnduk")));
              }, child: Text("Pdf")),
              ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DocFileCreating(text: "jkhkshdcksnduk")));
              }, child: Text("Doc"))
            ],
          ),
        ),
      ),
    );
  }
}
