import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewerPage extends StatefulWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String? localPath;
  bool isLoading = true;
  int totalPages = 0;
  int currentPage = 0;
  late PDFViewController pdfViewController;

  @override
  void initState() {
    super.initState();
    _loadPdfFromAssets();
  }

  Future<void> _loadPdfFromAssets() async {
    try {
      final byteData = await rootBundle.load(widget.pdfPath);
      final file = File('${(await getTemporaryDirectory()).path}/${widget.pdfPath.split('/').last}');
      await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);

      setState(() {
        localPath = file.path;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      _showErrorDialog('Error al cargar el PDF. Por favor, intente de nuevo.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visor de PDF'),
        actions: [
          if (localPath != null)
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                pdfViewController.setPage(currentPage > 0 ? currentPage - 1 : 0);
              },
            ),
          if (localPath != null)
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                pdfViewController.setPage(currentPage < totalPages - 1 ? currentPage + 1 : currentPage);
              },
            ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : localPath != null
          ? PDFView(
        filePath: localPath!,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageSnap: true,
        onRender: (_pages) {
          setState(() {
            totalPages = _pages!;
          });
        },
        onViewCreated: (PDFViewController vc) {
          pdfViewController = vc;
        },
        onPageChanged: (int? page, int? total) {
          setState(() {
            currentPage = page ?? 0;
            totalPages = total ?? 0;
          });
        },
        onError: (error) {
          _showErrorDialog('Error al mostrar el PDF: $error');
        },
        onPageError: (page, error) {
          _showErrorDialog('Error en la página $page: $error');
        },
      )
          : Center(child: Text('No se pudo cargar el PDF.')),
    );
  }
}
