import 'package:flutter/material.dart';
import 'home.dart';
 
import 'deskripsi.dart';

void main() => runApp(MyApp());
//Pada halaman ini berfungsi untuk memanggil/menjalankan halaman home dan deskripsi
class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    HomePage.tag: (context) => HomePage(),
    DescriptionPage.tag: (context) => DescriptionPage(null),
 
  };

  @override
  Widget build(BuildContext context) {

    //Pada baris ini dugnakan untuk menjalankan halaman Home dengan Method HomePage() dibungkus kedlaam halaman ini
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        //fontFamily: 'Nunito',
      ),
      //Ini halaman home yang dijalankan
      home: HomePage(),
      routes: routes,
    );
  }
}
