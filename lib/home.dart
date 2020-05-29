import 'package:flutter/material.dart';
import 'isiberita.dart';

void main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
//Tampilan awal pada mobile,ketika user mengunjungi aplikasi
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        //judul Aplikasi
        title: new Text("News Today", style: new TextStyle(color: Colors.white)),
      ),
      // Tampilan Body pada Home
      body: new SafeArea(
        child: new Column(
          children: [
            new Expanded(
              flex: 1,
              //Tampilan Container untuk berita
              child: new Container(
                width: width,
                color: Colors.white,
                child: new Center(
                  child: new GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    children: <Widget>[

                      //Tampilan Pilihan pada menu bisnis
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  //poisi ofot yang akan diinput berada ditengah container
                                  "assets/bisnis.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                //Caption berada setalah poto dengan text alogn berdada ditengah
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    "Info bisnis ",
                                    style: TextStyle(
                                        fontSize: 20.0, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // onTap disini digunakan sebagai tombol perintah atau url ke halaman Api yang akan dituju
                          onTap: () {
                            // id 1 disini digunakan untuk memanggil info bisnis dengan id API 1
                            var id = 1;
                            // id tadi akan di push kedalam NewsFeedPage 
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                //Kesini
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),


                      // Pada APlikasi ini terdapat delapan menu,dengan tiap baris perintah sama dengan tampilan menu pada info bisni,yang membedakannya hanya pada bagian gambar dan id untuk API
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/kesehatan.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Info Kesehatan",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.green),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                           onTap: () {
                            var id = 2;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/olahraga.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Info Olahraga",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.orange),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                         onTap: () {
                            var id = 3;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/science.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Info Science",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.red),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                           onTap: () {
                            var id = 4;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),

                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/teknologi.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Info Teknologi",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.red),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                           onTap: () {
                            var id = 5;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),

                      new Card(
                        elevation: 3.0,
                        child: new GestureDetector(
                          child: new Container(
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  "assets/hiburan.png",
                                  alignment: Alignment.center,
                                  width: 120.0,
                                  height: 120.0,
                                ),
                                new Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text("Info Hiburan",
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.red),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          ),
                           onTap: () {
                            var id = 6;
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new NewsFeedPage(id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
