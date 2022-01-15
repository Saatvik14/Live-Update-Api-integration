import 'package:apilive/api2.dart';
import 'package:apilive/apidata2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  List<Articles> list;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    print('fetch is working');
    var temp = await getHttp1();
    list = temp.articles == null ? [] : temp.articles;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: list == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : list.isEmpty
              ? Center(child: Text('No data available'))
              : ListView.builder(
                  itemBuilder: (_, i) => ListTile(
                    title: Text('${list[i].title}'),
                    subtitle: Text('${list[i].description}'),
                  ),
                  itemCount: list.length,
                ),
    );
  }
}
