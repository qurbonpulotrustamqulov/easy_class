import 'package:easy_class/question_ai_project.dart';
import 'package:easy_class/views/tab.dart';
import 'package:flutter/material.dart';

class MyRoutes{
  static const home = '/home';
  static const tabs = '/tabs';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const QuestionAiProject(),
    tabs: (context) => const Tabs(),
  };
}