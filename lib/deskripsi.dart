import 'package:flutter/material.dart';
 
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
 
void main() => runApp(new DescriptionPage(null));
//Disini merupakan  salah satu tampilan ketika user telah memilih salah satu pilihan pada menu isi berita
class DescriptionPage extends StatelessWidget {
  static String tag = 'description-page';
  DescriptionPage(this.urlnews);
  final String urlnews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // judul pada articcel
        title: new Text(
          "Artikel Lengkap",
          style: new TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      //Pada body ini Tampilan pada berita yang di pilih,yang sudah  di buat paada class news pada file isiberita.dart
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: WebviewScaffold(
          url: urlnews,
        ),
      ),
    );
  }
}
