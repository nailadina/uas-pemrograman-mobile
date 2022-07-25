// ignore_for_file: unnecessary_new, prefer_const_constructors, unnecessary_string_interpolations, unused_import, camel_case_types

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uas1/model/news.dart';
import 'package:uas1/view_model/fetchNews.dart';

// ignore: use_key_in_widget_constructors
class OtomotifNews extends StatefulWidget {
  // ignore: annotate_overrides
  _OtomotifNewsState createState() => _OtomotifNewsState();
}

class _OtomotifNewsState extends State<OtomotifNews> {
  var loading = false;
  List<news1> ind = [];
  // ignore: non_constant_identifier_names
  net Net = net();

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
                              padding: const EdgeInsets.only(bottom: 6.0),
                              child: Expanded(
                                child: Text(
                                  '${ind[index].title}',
                                  overflow: TextOverflow.clip,
                                  maxLines: 3,
                                  softWrap: false,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                                ),
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
  final news1 ind;

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
