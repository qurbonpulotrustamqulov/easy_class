import 'dart:convert';
import 'dart:io';

import 'package:easy_class/mixins/question_mixins.dart';
import 'package:easy_class/models/quiz_question.dart';

import 'package:easy_class/widgets/questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with QuestionMixins {
  String responseText = "";
  TextEditingController controller = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  Future<void> _createAndSavePDF(BuildContext context, String text) async {
    try {
      // PDF fayl yaratish
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(child: pw.Text(text));
          },
        ),
      );

      // Faylni telefon xotirasiga saqlash
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/example.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Faylni ulash tugmasi bilan birga dialog
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Fayl saqlandi'),
              content: const Text('Faylni ulashni xohlaysizmi?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yo\'q'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _shareFile(filePath); // Faylni ulash
                  },
                  child: const Text('Ha'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Xatolik: $e");
    }
  }

  // DOC fayl yaratish va saqlash
  Future<void> _createAndSaveDoc(BuildContext context, String text) async {
    try {
      // DOC faylini yaratish
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/example.doc';
      final file = File(filePath);

      // Faylga matn yozish
      await file.writeAsString(text);

      // Faylni ulash tugmasi bilan birga dialog
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Fayl saqlandi'),
              content: const Text('Faylni ulashni xohlaysizmi?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yo\'q'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _shareFile(filePath); // Faylni ulash
                  },
                  child: const Text('Ha'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print("Xatolik: $e");
    }
  }

  void _shareFile(String filePath) {
    Share.shareXFiles([XFile(filePath)], text: 'Ulashilgan file!');
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Color(0xff00bac7),
          title: const Text(
            "Easy Class",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                focusNode: myFocusNode,
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Mavzu kiriting",
                  suffixIcon: IconButton(
                    onPressed: () async {
                      if (controller.text != "") {
                        myFocusNode.unfocus();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content:
                                    Lottie.asset("assets/json/loading.json"),
                              );
                            });
                        await askQuestion(controller.text).then((value) {
                          responseText = value!;
                          Navigator.pop(context);
                          debugPrint("\n\n\n$responseText\n\n\n");
                          controller.clear();
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
                          .replaceAll("```", "")),
                    ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        List<QuizQuestion> res = parseQuizQuestions(responseText
                            .replaceAll("```json", "")
                            .replaceAll("```", ""));

                        if (res.isNotEmpty) {
                          String result = "";
                          for (int i = 0; i < res.length; i++) {
                            result +=
                                "${i + 1}.${res[i].question}\nA)${res[i].options?[0]}\nB)${res[i].options?[1]}\nC)${res[i].options?[2]}'\nD)${res[i].options?[3]}\n\n";
                          }
                          _createAndSavePDF(context, result);
                        }
                      },
                      child: const Text("Pdf ulashish")),
                  ElevatedButton(
                      onPressed: () {
                        List<QuizQuestion> res = parseQuizQuestions(responseText
                            .replaceAll("```json", "")
                            .replaceAll("```", ""));

                        if (res.isNotEmpty) {
                          String result = "";
                          for (int i = 0; i < res.length; i++) {
                            result +=
                                "${i + 1}.${res[i].question}\nA)${res[i].options?[0]}\nB)${res[i].options?[1]}\nC)${res[i].options?[2]}'\nD)${res[i].options?[3]}\n\n";
                          }
                          _createAndSaveDoc(context, result);
                        }
                      },
                      child: const Text("Doc ulashish"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
