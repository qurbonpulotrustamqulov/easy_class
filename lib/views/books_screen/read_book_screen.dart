import 'package:flutter/material.dart';

class ReadBookScreen extends StatefulWidget {
  final String text;
  final String title;
  const ReadBookScreen({super.key, required this.text, required this.title});

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00bac7),
        title: Text(
          widget.title,
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.text, style: TextStyle(
            fontSize: 18,
          ),
          textAlign: TextAlign.justify,),
        ),
      ),
    );
  }
}
