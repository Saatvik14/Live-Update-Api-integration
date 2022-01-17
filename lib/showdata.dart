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
                    itemBuilder: (_, i) => Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: <Widget>[
                          Image.network(list[i].urlToImage),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${list[i].title}',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${list[i].description}',
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    itemCount: 18,
                  ));
  }
}
