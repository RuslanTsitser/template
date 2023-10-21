import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

abstract class PdfEditorService {
  Future<void> readAssetPdf(String path);
}

class PdfEditorServiceImpl implements PdfEditorService {
  @override
  Future<void> readAssetPdf(String path) async {
    var bytes = await rootBundle.load(path);
    final PdfDocument document = PdfDocument(inputBytes: bytes.buffer.asUint8List());
    print(document.pages.count);
  }
}
