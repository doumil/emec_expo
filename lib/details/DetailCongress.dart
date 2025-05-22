import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/details/CongressMenu.dart';
import 'package:emec_expo/details/DetailSpeakeres.dart';
import 'package:emec_expo/model/congress_model.dart';
import 'package:emec_expo/model/congress_model_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../database_helper/database_helper.dart';
import '../main.dart';
import '../model/notification_model.dart';
import '../model/speakers_model.dart';
import '../services/local_notification_service.dart';

//bool check = false;

class DetailCongressScreen extends StatefulWidget {
  bool check;
  DetailCongressScreen({required this.check});

  @override
  _DetailCongressScreenState createState() => _DetailCongressScreenState();
}

class _DetailCongressScreenState extends State<DetailCongressScreen> {
  late SharedPreferences prefs;
  bool isChecked = false;
  List<Speakers> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Êtes-vous sûr'),
            content: new Text('Voulez-vous quitter une application'),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Non'),
              ),
              new TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: new Text('Oui '),
              ),
            ],
          ),
        )) ??
        false;
  }

  _loadData() async {
    //var url = "http://192.168.8.100/emecexpo/loadspeakers.php";
    //var res = await http.post(Uri.parse(url));
    //List<Speakers> speaker = (json.decode(res.body) as List)
    //  .map((data) => Speakers.fromJson(data))
    // .toList();
    var sp1 = Speakers("ali", "lahrichi", "fondateur et ceo kertys",
        "fondateur et ceo kertys,", "assets/av.jpg");
    litems.add(sp1);
    var sp2 = Speakers(
        "hamza",
        "aboulfeth",
        "fondateur",
        "président-directeur général de genious communications",
        "assets/speakers/hamza.jpg");
    litems.add(sp2);
    var sp3 = Speakers(
        "hamza",
        "aboulfeth",
        "fondateur",
        "président-directeur général de genious communications",
        "assets/speakers/hamza.jpg");
    litems.add(sp3);
    var sp4 = Speakers(
        "hamza",
        "aboulfeth",
        "fondateur",
        "président-directeur général de genious communications",
        "assets/speakers/hamza.jpg");
    litems.add(sp4);
    var sp5 = Speakers(
        "hamza",
        "aboulfeth",
        "fondateur",
        "président-directeur général de genious communications",
        "assets/speakers/hamza.jpg");
    litems.add(sp5);

    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            title: Text("EMEC EXPO"),
            backgroundColor: Color(0xff261350),
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: Colors.white), // Change the arrow icon here
              onPressed: () async{
                prefs = await SharedPreferences.getInstance();
                prefs.setString("Data", "5");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            WelcomPage()));
              },
            )),
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.only(top: 80, bottom: 0),
                      width: double.infinity,
                      height: height * 0.65,
                      color: Colors.black26,
                      child: new Card(
                        color: Colors.white,
                        shape: BorderDirectional(
                          bottom: BorderSide(color: Colors.black12, width: 1),
                        ),
                        child: new ListTile(
                          leading: Container(
                            padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                            decoration: BoxDecoration(
                              color: Color(0xff261350),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(5.0),
                                right: Radius.circular(5.0),
                              ),
                            ),
                            width: 60.0,
                            child: Text(
                              "10:00\n11:00",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                            child: Text(
                              "TITLE",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        icon: new Icon(
                                          (widget.check)
                                              ? Icons.add_box_outlined
                                              : Icons.add_box,
                                          color: Color(0xff00c1c1),
                                        ),
                                        iconSize: 30.0,
                                        onPressed: () {
                                          if (widget.check == true) {
                                            setState(() {
                                              widget.check = !widget.check;
                                              // _addAgenda();
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    //(check)
                                                    //? MyDialogDAgenda()
                                                    MyDialog()
                                                  ],
                                                ),
                                              );
                                            });
                                          } else if (widget.check == false) {
                                            setState(() {
                                              widget.check = !widget.check;
                                              // _addAgenda();
                                              showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    //(check)
                                                    MyDialogDAgenda(
                                                        check: false),
                                                    //MyDialog()
                                                  ],
                                                ),
                                              );
                                            });
                                          }
                                        }),
                                    Text("add to my agenda"),
                                  ],
                                ),
                                Text(
                                  "Who doesn’t want the paragraphs you write to impress the reader."
                                  " The most authoritative method that can be used to realize this situation is to use a descriptive paragraph."
                                  " A descriptive paragraph describes a person, an object, an event, or a place in detail."
                                  " This type of paragraph, which should contain many details, does not bother the reader. "
                                  "This feature is the best feature of the descriptive paragraph type.",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      )),
                )),
            Expanded(
              flex: 1,
              child: Container(
                // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                //margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Color(0xff261350),
                ),
                width: double.maxFinite,
                child: Center(
                    child: Text(
                  "Speakers",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Expanded(
                flex: 3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: litems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 0.0),
                      child: Container(
                        width: 140,
                        height: 140,
                        //color: Colors.red,
                        child: ListTile(
                          title: Column(
                            children: [
                              Center(
                                child: ClipOval(
                                    child: Image.asset(
                                  '${litems[index].image}',
                                )),
                              ),
                              Text(
                                  '${litems[index].fname} ${litems[index].fname}',
                                  style: (TextStyle(
                                      color: Color(0xff261350),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold)))
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailSpeakersScreen()));
                          },
                        ),
                      ),
                    );
                  },
                )),
          ],
        ));
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FadeInUp(
      duration: Duration(milliseconds: 500),
      child: AlertDialog(
          title: Container(child: Text("Add to youre agenda ")),
          content: Container(),
          actions: <Widget>[
            Container(
                height: height * 0.084,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                      decoration: BoxDecoration(
                        color: Color(0xff261350),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5.0),
                          right: Radius.circular(5.0),
                        ),
                      ),
                      //width:30.0,
                      child: Center(
                          child: Text(
                        "10 mai 2023",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
                      decoration: BoxDecoration(
                        color: Color(0xff261350),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5.0),
                          right: Radius.circular(5.0),
                        ),
                      ),
                      child: Center(
                          child: Text(
                        "10 : 00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                )),
            Row(
              children: [
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                      Container(
                          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                          child: Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          )),
                      GestureDetector(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                            child: Text('Add to Google Calender',
                                style: TextStyle(fontSize: height * 0.020)),
                          )),
                    ])),
              ],
            ),
            Row(
              children: [
                new TextButton(
                  onPressed: () {
                    // Navigator.pop(context, 'Annuler');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailCongressScreen(
                                  check: false,
                                )));
                  },
                  child: new Text('Cancel',
                      style: TextStyle(
                          color: Color(0xff00c1c1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Color(0xff261350),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    //primary: Colors.white,
                    backgroundColor: Colors.white,
                  ),
                  //color: Colors.white,
                  onPressed: () {
                    if (isChecked == true) {
                      _addTogoogle();
                    }
                    _addAgenda();
                    //Navigator.pop(context, 'Annuler');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailCongressScreen(check: false)));
                    // check = true;
                    // print(check);
                  },
                  child: Text(
                    ('Add to my agenda'),
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff261350),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
    );
  }

  Future<void> _addTogoogle() async {
    NotificationService().showNotifByDate(
        title: 'EMEC EXPO',
        body: "Performing hot reload..."
            "Syncing files to device CPH1819..."
            "Reloaded 2 of 1626 libraries in 1 958ms (compile: 151 ms, reload: 711 ms, reassemble: 577 ms.",
        date: DateTime.now().add(Duration(seconds: 10)));
    final Event event = Event(
      title: 'Event title',
      description: 'Event description',
      location: 'Event location',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      androidParams: AndroidParams(
        emailInvites: [], // on Android, you can add invite emails to your event.
      ),
    );
    Add2Calendar.addEvent2Cal(event);
  }
}

void _addAgenda() async {
  String title='EMEC EXPO',body="Introducing an all-new Lottie Editor- a web-based editor "
      "that allows you to edit, tweak and personalize your Lottie animations.";
  var db = new DataBaseHelperNotif();
  NotificationService().showNotifByDate(
      title: title,
      body: body,
      date: DateTime.now().add(Duration(seconds: 10)));
  //List<CongressDClass> LAgenda=[];
  var c1 = CongressDClass(
      title,
   body,
      "10:00",
      "11:00");
  //LAgenda.add(c1);
  await db.saveAgenda(c1);
  await db.saveNoti(NotifClass(title,"03/03/2023","10:00", body));
  Fluttertoast.showToast(
    msg: "agenda has saved successfully",
    toastLength: Toast.LENGTH_SHORT,
  );
}

class MyDialogDAgenda extends StatefulWidget {
  bool check;
  MyDialogDAgenda({required this.check});
  @override
  _MyDialogDAgendaState createState() => new _MyDialogDAgendaState();
}

class _MyDialogDAgendaState extends State<MyDialogDAgenda> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FadeInUp(
      duration: Duration(milliseconds: 500),
      child: AlertDialog(
          title:
              Container(child: Text("Are you sure to remove youre agenda ?")),
          content: Container(),
          actions: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                new TextButton(
                  onPressed: () {
                    //Navigator.pop(context, 'Annuler');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailCongressScreen(
                                  check: false,
                                )));
                    //check = false;
                    //print(check);
                  },
                  child: new Text('Cancel',
                      style: TextStyle(
                          color: Color(0xff00c1c1),
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          color: Color(0xff261350),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    //primary: Colors.white,
                    backgroundColor: Colors.white, // Replaces 'primary'
                  ),
                  //color: Colors.white,
                  onPressed: () {
                    //check = true;
                    //print(check);
                    Navigator.pop(context, 'Annuler');
                  },
                  child: Text(
                    ('yes'),
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff261350),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
