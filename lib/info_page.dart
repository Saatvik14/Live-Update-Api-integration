import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'api3.dart';
import 'apidata3.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:intl/intl.dart';
import 'package:simple_moment/simple_moment.dart';

List<dynamic> list1 = [];

class InfoPage extends StatefulWidget {
  final int pincode;
  DateTime today = DateTime.now();
  String tom() {
    DateTime tomorrow = today.add(const Duration(days: 1));
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(tomorrow).toString();
    return formatted;
  }

  InfoPage(this.pincode);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List<Session> list;
  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    print('>>>>>>in fetch');

    var temp = await getHttp(widget.pincode, widget.tom());
    print(widget.pincode);
    print(widget.tom());
    list = temp.sessions == null ? [] : temp.sessions;
    data(list, false, "ALL", 18);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list1 == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : list1.isEmpty
              ? Center(child: Text('Wrong input Or Slots Not Available'))
              : ListView.builder(
                  itemBuilder: (_, i) => ListTile(
                    title: Text(list1[i]),
                  ),
                  itemCount: list1.length,
                ),
    );
  }
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

void data(List<Session> list, bool avaiDose1, String vaccType, int age) {
  for (int i = 0; i < list.length; i++) {
    if (avaiDose1 == true && age == 18) {
      if (list[i].availableCapacityDose1 != 0 && list[i].minAgeLimit == 18) {
        if (vaccType == "COVISHIELD" && list[i].vaccine == "COVISHIELD") {
          list1.add(list[i].name);
        } else if (vaccType == "Covaxin" && list[i].vaccine == "COVAXIN") {
          list1.add(list[i].name);
        } else if (vaccType == "SPUTNIK V" && list[i].vaccine == "SPUTNIK V") {
          list1.add(list[i].name);
        } else if (vaccType == "ALL") {
          list1.add(list[i].name);
        }
      }
    } else if (avaiDose1 == true && age == 45) {
      if (list[i].availableCapacityDose1 != 0 && list[i].minAgeLimit == 45) {
        if (vaccType == "COVISHIELD" && list[i].vaccine == "COVISHIELD") {
          list1.add(list[i].name);
        } else if (vaccType == "Covaxin" && list[i].vaccine == "COVAXIN") {
          list1.add(list[i].name);
        } else if (vaccType == "SPUTNIK V" && list[i].vaccine == "SPUTNIK V") {
          list1.add(list[i].name);
        } else if (vaccType == "ALL") {
          list1.add(list[i].name);
        }
      }
    } else if (avaiDose1 == false && age == 18) {
      if (list[i].availableCapacityDose2 != 0 && list[i].minAgeLimit == 18) {
        if (vaccType == "COVISHIELD" && list[i].vaccine == "COVISHIELD") {
          list1.add(list[i].name);
        } else if (vaccType == "Covaxin" && list[i].vaccine == "COVAXIN") {
          list1.add(list[i].name);
        } else if (vaccType == "SPUTNIK V" && list[i].vaccine == "SPUTNIK V") {
          list1.add(list[i].name);
        } else if (vaccType == "ALL") {
          list1.add(list[i].name);
        }
      }
    } else if (avaiDose1 == false && age == 45) {
      if (list[i].availableCapacityDose2 != 0 && list[i].minAgeLimit == 45) {
        if (vaccType == "COVISHIELD" && list[i].vaccine == "COVISHIELD") {
          list1.add(list[i].name);
        } else if (vaccType == "Covaxin" && list[i].vaccine == "COVAXIN") {
          list1.add(list[i].name);
        }
        if (vaccType == "SPUTNIK V" && list[i].vaccine == "SPUTNIK V") {
          list1.add(list[i].name);
        } else if (vaccType == "ALL") {
          list1.add(list[i].name);
        }
      }
    }
  }
  for (int i = 0; i < list1.length; i++) {
    print(list[i]);
  }
  print(list1.length);
}
