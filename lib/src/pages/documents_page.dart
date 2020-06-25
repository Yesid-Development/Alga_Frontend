import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;

class DocumentsPage extends StatefulWidget {
  @override
  _DocumentsPageState createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  String assetPDFPath = "";
  // String urlPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromAsset("assets/mypdf.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });

    // getFileFromUrl("http://www.pdf995.com/samples/pdf.pdf").then((f) {
    //   setState(() {
    //     urlPDFPath = f.path;
    //     print(urlPDFPath);
    //   });
    // });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdf.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

  // Future<File> getFileFromUrl(String url) async {
  //   try {
  //     var data = await http.get(url);
  //     var bytes = data.bodyBytes;
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/mypdfonline.pdf");

  //     File urlFile = await file.writeAsBytes(bytes);
  //     return urlFile;
  //   } catch (e) {
  //     throw Exception("Error opening url file");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Documentos"),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, i) => Divider(
            // endIndent: 50,
            thickness: 0.9, //grosor de separador
            color: Colors.white24 //color separador
            ),
        itemCount: 1,
        itemBuilder: (context, i) => ListTile(
          leading: FaIcon(
            FontAwesomeIcons.filePdf,
            color: Colors.red,
          ), // Icono de archivo
          title: Text('PDF_995'), //Titulo de archivo
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            if (assetPDFPath != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PdfViewPage(path: assetPDFPath)));
            }
          },
        ),
      ),
    );
  }
}

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF_995"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
    );
  }
}
