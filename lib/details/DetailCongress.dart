import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/details/DetailSpeakeres.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/speakers_model.dart';

class DetailCongressScreen extends StatefulWidget {
  const DetailCongressScreen({Key? key}) : super(key: key);

  @override
  _DetailCongressScreenState createState() => _DetailCongressScreenState();
}

class _DetailCongressScreenState extends State<DetailCongressScreen> {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
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
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top:80,bottom:0),
                  width: double.infinity,
                  height: height*0.65,
                    color: Colors.black26,
                    child: new Card(
                      color: Colors.white,
                      shape: BorderDirectional(
                        bottom:BorderSide(color: Colors.black12, width: 1),
                      ),
                      child: new ListTile(
                        leading: Container(
                          padding: EdgeInsets.fromLTRB(4, 4,4,4),
                          decoration: BoxDecoration(
                            color: Color(0xff261350),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(5.0),
                              right: Radius.circular(5.0),
                            ),
                          ),
                          width:60.0,
                          child: Text("10:00\n11:00",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        title: Padding(
                          padding: EdgeInsets.fromLTRB(14, 14,14,14),
                          child: Text(
                            "TITLE",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle:Padding(
                          padding: EdgeInsets.fromLTRB(14,14,14,14),
                          child: Text(
                            "Who doesn’t want the paragraphs you write to impress the reader."
                                " The most authoritative method that can be used to realize this situation is to use a descriptive paragraph."
                                " A descriptive paragraph describes a person, an object, an event, or a place in detail."
                                " This type of paragraph, which should contain many details, does not bother the reader. "
                                "This feature is the best feature of the descriptive paragraph type. One of the advantages of this feature is that the details given affect the reader.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                        },
                      ),
                    )
                ),
              )
              ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  color: Color(0xff261350),
                ),
                width: double.maxFinite,
                child: Center(
                    child: Text(
                      "Speakers",
                      style:
                      TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: height*0.65,
                  color: Colors.black26,
                  child: new ListView.builder(
                      padding: EdgeInsets.only(top: 0,bottom: 4),
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

          ],
        ));
  }
}

