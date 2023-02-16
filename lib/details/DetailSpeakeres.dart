import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/model/congress_model_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DetailCongress.dart';

class DetailSpeakersScreen extends StatefulWidget {
  const DetailSpeakersScreen({Key? key}) : super(key: key);

  @override
  _DetailSpeakersScreenState createState() => _DetailSpeakersScreenState();
}

class _DetailSpeakersScreenState extends State<DetailSpeakersScreen> {
  List<CongressDClass> litems = [];
  List<CongressDClass> litemsAllS = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    litemsAllS=litems;
    super.initState();
  }
  _loadData() async {
    // var url = "http://192.168.8.100/emecexpo/loadDetailCongress.php";
    //var res = await http.post(Uri.parse(url));
    //List<ProductClass> prod = (json.decode(res.body) as List)
    //  .map((data) => ProductClass.fromJson(data))
    //.toList();
    //litems=prod;
    var prod1=CongressDClass("Appinio","Adaptive Soc Services","10:00","12:00");
    litems.add(prod1);
    var prod2=CongressDClass("Appinio","Adaptive Soc Services","12:00","14:00");
    litems.add(prod2);
    var prod3=CongressDClass("Appinio","Adaptive Soc Services","14:00","16:00");
    litems.add(prod3);
    var prod4=CongressDClass("Appinio","Adaptive Soc Services","16:00","17:00");
    litems.add(prod4);
    var prod5=CongressDClass("Appinio","Adaptive Soc Services","17:00","19:30");
    litems.add(prod5);
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
                          leading:   ClipOval(
                              child: Image.asset(
                                width:60,
                                height: 60,
                                'assets/av.jpg',
                              )),
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(14, 14,14,14),
                            child: Text(
                              "NAME  LASTNAME",
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
                      "Sessions",
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
                          leading:Container(
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
                          title:Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2.0,left: 2,top: 2),
                              child: Text("${litems[position].title}",
                                style: TextStyle( fontSize: 15,fontWeight:FontWeight.bold,color:  Color(0xff261350)),
                                overflow:TextOverflow.visible,
                              ),
                            ),
                          ),
                          subtitle: Container(
                            child: new Text("${litems[position].discription}",
                              style: TextStyle(height: 2),
                              overflow:TextOverflow.visible,
                            ),
                          ),
                          onTap: (){

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailCongressScreen(check: false,)));
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

