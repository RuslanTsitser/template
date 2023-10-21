import 'package:flutter/material.dart';
import 'package:pdf_editor/pdf_editor_service/pdf_editor_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PdfPage(),
    );
  }
}

class PdfPage extends StatelessWidget {
  const PdfPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newFile = PdfEditorServiceImpl().readAssetPdf("files/barcelona.pdf");
        },
      ),
      body: Center(
        child: Text('Hello World!'),
      ),
    );
  }
}
