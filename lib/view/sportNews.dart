// ignore_for_file: unnecessary_new, prefer_const_constructors, non_constant_identifier_names, annotate_overrides, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:uas1/model/news.dart';
import 'package:uas1/view_model/fetchNews.dart';

class SportNews extends StatefulWidget {
  _SportNewsState createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  var loading = false;
  List<news2> ind = [];
  net1 Net = net1();

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
              // ignore: unnecessary_new
              return new GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => detInd(ind: ind[index])));
                },
                // ignore: unnecessary_new
                child: new Card(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          ind[index].image,
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
                                ind[index].title,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                               
                              ),
                            ),
                            Text(
                              ind[index].date,
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
  final news2 ind;

  const detInd({Key? key, required this.ind}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget judul = Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
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
            ),
          )
        ],
      ),
    );

    Widget bagianDesc = Container(
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
