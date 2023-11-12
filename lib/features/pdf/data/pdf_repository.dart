import 'package:pdf_editor/core/services/pdf_reader_service/pdf_reader_service.dart';
import 'package:pdf_editor/features/pdf/domain/pdf_repository.dart';

class PdfRepositoryImpl implements PdfRepository {
  final PdfReaderService pdfReaderService;

  const PdfRepositoryImpl({required this.pdfReaderService});

  @override
  Future<void> readAssetPdf(String path) {
    return pdfReaderService.readAssetPdf(path);
  }
}
