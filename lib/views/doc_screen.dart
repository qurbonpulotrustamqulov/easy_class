import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DocFileCreating extends StatelessWidget {
  final String text;

  DocFileCreating({required this.text});

  // DOC fayl yaratish va saqlash
  Future<void> _createAndSaveDoc(BuildContext context) async {
    try {
      // DOC faylini yaratish
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/example.doc';
      final file = File(filePath);

      // Faylga matn yozish
      await file.writeAsString(text);

      // Fayl saqlandi degan xabar chiqarish
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("DOC fayl saqlandi: $filePath")),
      );

      // Faylni ulash tugmasi bilan birga dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Fayl saqlandi'),
            content: Text('Faylni ulashni xohlaysizmi?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Yo\'q'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _shareFile(filePath); // Faylni ulash
                },
                child: Text('Ha'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print("Xatolik: $e");
    }
  }

  // Faylni ulash
  void _shareFile(String filePath) {
    Share.shareXFiles([XFile(filePath)], text: 'Mana men yaratgan DOC fayl!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DOC fayl yaratish va saqlash'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _createAndSaveDoc(context),
          child: Text('DOC yaratish va saqlash'),
        ),
      ),
    );
  }
}
