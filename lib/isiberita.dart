import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'deskripsi.dart';
import 'dart:io';
//ini halaman ketika user menklik salah satu menu info pada halaman home 
class NewsFeedPage extends StatelessWidget {
  static String tag = "NewsFeedPage-tag";
  NewsFeedPage(this.text);
  final int text;

  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    //perintah ini Ditentukan dari id yang di panggil pada halaman home,misal id yang di pilih 1 yakni info bsini,maka title akan menjadi info bisnis
    String title;
    if (text == 1) {
      title = "Info Bisnis";
    } else if (text == 2) {
      title = "Kesehatan";
    } else if (text == 3) {
      title = "Olahraga";
    } else if (text == 4) {
      title = "Science";
    } else if (text == 5) {
      title = "Teknologi";
    } else if (text == 6) {
      title = "Entertainment";
    }  
    return Scaffold(
      appBar: AppBar(
        //Titile disini tergantung string ttitle diatas
        title: new Text("Berita Utama $title ",
            style: new TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      //Pada baris ini merupakan area pada program,dimana tiap berita yang tampil akan di sort diabgian ini.
      body: new SafeArea(
          child: new Column(
        children: [
          new Expanded(
            flex: 1,
            
            child: new Container(
                width: width,
                color: Colors.white,
                child: new GestureDetector(
                  //disni ada list untuk membungkus isi berita yang di query dari Apinews tadi
                  child: new FutureBuilder<List<News>>(
                    //Agar tidak terlalu panjang dan mudah dibaca,Api tadi bungkus kedalam funtion fetchnews,yang mna didalamnya diberi parameter http.client dan text
                    future: fatchNews(
                        http.Client(), text), // a Future<String> or null
                    builder: (context, snapshot) {
                      //jika terjai error perogram aakn menampilakn snashot.error
                      if (snapshot.hasError) print(snapshot.error);
                      //dan ini return errornya
                      return snapshot.hasData
                          ? NewsList(news: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
//ini function fatchNews yang digunakan untuk membungkus Apinews
Future<List<News>> fatchNews(http.Client client, id) async {
  //terdapat string url digunakan untuk membungkus url
  String url;
  //disini ada percabangan dimana tiap id yang di sajikan menentukan Api mana yang akan ditampilakn pada halaman
  if (id == 1) {
    // Contant.base_url disini digunakan untuk menyambungkan kehalaman APi.dart tadi ,begitu juga dengan contant.key,dan untuk "top-headlines?country=id&category=business&apiKey=" ini didapatkan dari halaman newsApi.org ,dimana disana disajikan berbagai url tergantung negara mana yang ingin kita tampilkan pada plikasi 
    url = Constant.base_url +
        "top-headlines?country=id&category=business&apiKey=" +
        Constant.key;
  } else if (id == 2) {
    url = Constant.base_url +
        "top-headlines?country=id&category=health&apiKey=" +
        Constant.key;
  } else if (id == 3) {
    url = Constant.base_url +
        "top-headlines?country=id&category=sports&apiKey=" +
        Constant.key;
  } else if (id == 4) {
    url = Constant.base_url +
        "top-headlines?country=id&category=science&apiKey=" +
        Constant.key;
  } else if (id == 5) {
    url = Constant.base_url +
        "top-headlines?country=id&category=technology&apiKey=" +
        Constant.key;
  }  else if (id == 6) {
    url = Constant.base_url +
        "top-headlines?country=id&category=entertainment&apiKey=" +
        Constant.key;
  }   
   

  // final response disini digunakan untuk tampilan loading pada aplikasi
  final response = await client.get(url);
  return compute(parsenews, response.body);
}

//parsenews disini digunakan untuk menlist articles dari APi
List<News> parsenews(String responsebody) {
  final parsed = json.decode(responsebody);
  return (parsed["articles"] as List)
      .map<News>((json) => new News.fromJson(json))
      .toList();
}

//Disini ADA class baru bernama News yang digunakan pada pada file deskripsi.dart 
class News {
  String auther;
  String title;
  String description;
  String url;

  News({this.auther, this.title, this.description, this.url});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> news;

  NewsList({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return new Card(
          child: new ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.star,
                color: Colors.white,
              ),
              backgroundColor: Colors.lightBlue,
            ),
            title: Text(news[index].title),
            onTap: () {
              var url = news[index].url;
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new DescriptionPage(url),
                  ));
            },
          ),
        );
      },
    );
  }
}
