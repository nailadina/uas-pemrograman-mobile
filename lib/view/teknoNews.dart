// ignore_for_file: file_names, duplicate_ignore
// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_interpolations, unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas1/model/news.dart';
import 'package:uas1/view_model/fetchNews.dart';

class TeknoNews extends StatefulWidget {
  _TeknoNewsState createState() => _TeknoNewsState();
}

class _TeknoNewsState extends State<TeknoNews> {
  var loading = false;
  List<news3> ind = [];
  net2 Net = net2();

  getData() async {
    ind = await Net.getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: ind.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detInd(ind: ind[index])));
                },
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          '${ind[index].image}',
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${ind[index].title}',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                               
                              ),
                            ),
                            Text(
                              '${ind[index].date}',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class detInd extends StatelessWidget {
  final news3 ind;

  const detInd({Key? key, required this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget judul = Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(ind.title,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Text(
                  ind.date,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                Text(ind.author, style: TextStyle(color: Colors.grey[700]))
              ],
            ),
          )
        ],
      ),
    );

    // ignore: duplicate_ignore
    Widget bagianDesc = Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(10),
      child: Text(
        ind.content,
        style: Theme.of(context).textTheme.bodyText1,
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(ind.title),
      ),
      body: ListView(
        children: [
          Image.network(
            ind.image,
            width: 600,
            fit: BoxFit.cover,
          ),
          judul,
          bagianDesc,
        ],
      ),
    );
  }
}
