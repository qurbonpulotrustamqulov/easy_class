
import 'package:easy_class/views/tab.dart';
import 'package:flutter/material.dart';

class MyRoutes{
  static const tabs = '/tabs';

  static final Map<String, WidgetBuilder> routes = {
    tabs: (context) => const Tabs(),
  };
}