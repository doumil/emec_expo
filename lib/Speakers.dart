import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'details/DetailSpeakeres.dart';
import 'model/speakers_model.dart';
import 'package:http/http.dart' as http;


class SpeakersScreen extends StatefulWidget {
  const SpeakersScreen({Key? key}) : super(key: key);

  @override
  _SpeakersScreenState createState() => _SpeakersScreenState();
}

class _SpeakersScreenState extends State<SpeakersScreen> {
  List<Speakers> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
  _loadData() async {
    //var url = "http://192.168.8.100/emecexpo/loadspeakers.php";
    //var res = await http.post(Uri.parse(url));
    //List<Speakers> speaker = (json.decode(res.body) as List)
      //  .map((data) => Speakers.fromJson(data))
       // .toList();
    var sp1=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/1.jpg");
    litems.add(sp1);
    var sp2=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/2.jpg");
    litems.add(sp2);
    var sp3=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/3.jpg");
    litems.add(sp3);
    var sp4=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/4.jpg");
    litems.add(sp4);
    var sp5=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/5.jpg");
    litems.add(sp5);
    var sp6=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/6.jpg");
    litems.add(sp6);
    var sp7=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/7.jpg");
    litems.add(sp7);
    var sp8=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/8.jpg");
    litems.add(sp8);
    var sp9=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/9.jpg");
    litems.add(sp9);
    var sp10=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/10.jpg");
    litems.add(sp10);
    var sp11=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/11.jpg");
    litems.add(sp11);
    var sp12=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/12.jpg");
    litems.add(sp12);
    var sp13=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/13.jpg");
    litems.add(sp13);
    var sp14=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/14.jpg");
    litems.add(sp14);
    var sp15=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/15.jpg");
    litems.add(sp15);
    var sp16=Speakers("ali", "lahrichi", "fondateur et ceo kertys", "fondateur et ceo kertys,","assets/speakers/speakers2024/16.jpg");
    litems.add(sp16);
    var sp17=Speakers("hamza", "aboulfeth", "fondateur",
        "président-directeur général de genious communications","assets/speakers/speakers2024/17.jpg");
    litems.add(sp17);
    var sp18=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/18.jpg");
    litems.add(sp18);
    var sp19=Speakers("ouafa ", "oualfi", "Responsable accompagnement", "partenariats-technopark maroc","assets/speakers/speakers2024/19.jpg");
    litems.add(sp19);
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: isLoading == true
              ? Center(
              child: SpinKitThreeBounce(
                color: Color(0xff00c1c1),
                size: 30.0,
              ))
              :  FadeInDown(
            duration: Duration(milliseconds: 500),
                child: Container(
                  color:Colors.black26,
                  child: new ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (_, int position) {
                    return new Card(
                      margin: EdgeInsets.only(top: height * 0.01),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(5.0),
                            right: Radius.circular(5.0),
                          )
                      ),
                      child: new ListTile(
                        leading:  ClipOval(
                            child: Image.asset(
                              width:60,
                              height: 60,
                              '${litems[position].image}',
                            )),
                        title:Container(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2.0,left: 2,top: 2),
                            child: Text("${litems[position].fname} ${litems[position].lname}",
                              style: TextStyle( fontSize: 15,fontWeight:FontWeight.bold,color:  Color(0xff261350)),
                                overflow:TextOverflow.visible,
                            ),
                          ),
                        ),
                        subtitle: Container(
                          child: new Text("${litems[position].characteristic}",
                            style: TextStyle(height: 2),
                            overflow:TextOverflow.visible,
                          ),
                        ),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpeakersScreen()));
                        },
                      ),
                      elevation: 3.0,
                    );
                  }),
                ),
              ),
        ));
  }
}
