import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ContractViewer extends StatefulWidget {
  const ContractViewer({super.key});

  @override
  _ContractViewerState createState() => _ContractViewerState();
}

class _ContractViewerState extends State<ContractViewer> {
  String? localPath;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    final byteData = await rootBundle.load('assets/Documents/WorkContract.pdf');
    final file = File('${(await getTemporaryDirectory()).path}/WorkContract.pdf');
    await file.writeAsBytes(byteData.buffer.asUint8List(), flush: true);
    setState(() {
      localPath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contract Viewer'),
      ),
      body: localPath != null
          ? PDFView(
              filePath: localPath,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
