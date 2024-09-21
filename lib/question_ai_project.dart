import 'package:easy_class/views/quiz_screen.dart';
import 'package:flutter/material.dart';

class QuestionAiProject extends StatelessWidget {
  const QuestionAiProject({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: QuizScreen(),
    );
  }
}
