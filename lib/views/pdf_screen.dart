import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileCreationPage extends StatelessWidget {
  final String text;

  FileCreationPage({required this.text});

  // PDF yaratish va saqlash
  Future<void> _createAndSavePDF(BuildContext context) async {
    try {
      // PDF fayl yaratish
      final pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
                child: pw.Text(text)
            );
          },
        ),
      );

      // Faylni telefon xotirasiga saqlash
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/example.pdf';
      final file = File(filePath);
      await file.writeAsBytes(await pdf.save());

      // Fayl saqlandi degan xabar chiqarish
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF fayl saqlandi: $filePath")),
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
    Share.shareXFiles([XFile(filePath)], text: 'Mana men yaratgan PDF fayl!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fayl yaratish va saqlash'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _createAndSavePDF(context),
          child: Text('PDF yaratish va saqlash'),
        ),
      ),
    );
  }
}
