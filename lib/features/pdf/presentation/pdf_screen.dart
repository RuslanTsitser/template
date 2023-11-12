import 'package:flutter/material.dart';

class PdfScreen extends StatelessWidget {
  const PdfScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add onPressed
        },
      ),
      body: const Center(
        child: Text('Pdf Page'), // TODO: Add widget for pdf
      ),
    );
  }
}
