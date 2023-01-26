import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:emec_expo/detailEx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'main.dart';
import 'model/exhibitors_model.dart';
import 'package:http/http.dart' as http;

class ExhibitorsScreen extends StatefulWidget {
  const ExhibitorsScreen({Key? key}) : super(key: key);

  @override
  _ExhibitorsScreenState createState() => _ExhibitorsScreenState();
}

class _ExhibitorsScreenState extends State<ExhibitorsScreen> {
  bool _pressed = false;
  bool _pressedStar=false;
  List<ExhibitorsClass> litems = [];
  List<ExhibitorsClass> litemsFav = [];
  List<ExhibitorsClass> litemsStar = [];
  List<ExhibitorsClass> litemsAll = [];
  List<ExhibitorsClass> litemsAllS = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    litemsAllS=litems;
    super.initState();
  }

  _loadData() async {
    // var url = "http://192.168.8.100/emecexpo/loadexhibitors.php";
    //var res = await http.post(Uri.parse(url));
    //List<ExhibitorsClass> exh = (json.decode(res.body) as List)
    //  .map((data) => ExhibitorsClass.fromJson(data))
    //.toList();
    var ex1 = ExhibitorsClass(0,'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/technopark.png',false,false);
    litems.add(ex1);
    var ex2 = ExhibitorsClass(1,
        'AMMC', 'EF300', '', '', '', '', 'assets/partners/ammc.png',false,false);
    litems.add(ex2);
    var ex3 = ExhibitorsClass(2,'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/mediradio.png',false,false);
    litems.add(ex3);
    var ex4 = ExhibitorsClass(3,'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/technopark.png',false,false);
    litems.add(ex4);
    var ex5 = ExhibitorsClass(4,
        'AMMC', 'EF300', '', '', '', '', 'assets/partners/ammc.png',false,false);
    litems.add(ex5);
    var ex6 = ExhibitorsClass(5,'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/mediradio.png',false,false);
    litems.add(ex6);
    var ex7 = ExhibitorsClass(6,'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/technopark.png',false,false);
    litems.add(ex7);
    var ex8 = ExhibitorsClass(7,
        'AMMC', 'EF300', '', '', '', '', 'assets/partners/ammc.png',false,false);
    litems.add(ex8);
    var ex9 = ExhibitorsClass(8,'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/mediradio.png',false,false);
    litems.add(ex9);
    var ex10 = ExhibitorsClass(9,'TECHNOPARK', 'ED240', '', '', '', '',
        'assets/partners/technopark.png',false,false);
    litems.add(ex10);
    var ex11 = ExhibitorsClass(10,
        'AMMC', 'EF300', '', '', '', '', 'assets/partners/ammc.png',false,false);
    litems.add(ex11);
    var ex12 = ExhibitorsClass(11,'MEDI 1 RADIO', 'RZ901', '', '', '', '',
        'assets/partners/mediradio.png',false,false);
    litems.add(ex12);
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }
void _Search(String entrK){
  List<ExhibitorsClass> result = [];
  print(litemsAllS);
if(entrK.isNotEmpty){
    result=litems.where((user) => user.title.toString().toUpperCase().contains(entrK.toUpperCase())).toList();
    setState(() {
      litems=result;
    });
}
else{
  setState(() {
    litems=litemsAllS;
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Color(0xff261350),
        automaticallyImplyLeading: false,
        actions: [
           Container(
             width:250,
             child: TextField(
               onChanged:(value)=> _Search(value),
               obscureText: false,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(Icons.search,color: Colors.white,),
              ),
          ),
           ),
          //IconButton(
            //icon: new Icon(Icons.search),
            //disabledColor: Colors.white70,
            //onPressed: () => () {
            //},
          //),
          IconButton(
            icon: new Icon(
                (_pressed == false) ? Icons.verified_outlined : Icons.verified),
            onPressed: () {
              setState(() {
                _pressed = !_pressed;
                if(_pressed==true)
                  {
                    litemsAll=litems;
                    litemsFav=litems.where((user) => user.fav.toString().toLowerCase().contains("true")).toList();
                    print(litemsFav);
                    litems=litemsFav;
                  }
                else{
                  litems=litemsAll;
                }
              });
            },
          ),
          IconButton(
            icon: new Icon(
                (_pressedStar == false) ? Icons.star_border : Icons.star,color:Color(0xff00c1c1)),
            //disabledColor: Color(0xff00c1c1),
            onPressed: () {
              setState(() {
                _pressedStar = !_pressedStar;
                if(_pressedStar==true)
                {
                  litemsAll=litems;
                  litemsStar=litems.where((user) => user.star.toString().toLowerCase().contains("true")).toList();
                  litems=litemsStar;
                }
                else{
                  litems=litemsAll;
                }

              });
            },
          ),
        ],
      ),
      body: isLoading == true
          ? Center(
              child: SpinKitThreeBounce(
              color: Color(0xff00c1c1),
              size: 30.0,
            ))
          :  FadeInDown(
        duration: Duration(milliseconds: 500),
            child: Container(
                color: Colors.white,
                child: new ListView.builder(
                    itemCount: litems.length,
                    itemBuilder: (_, int position) {
                      return new Card(
                        color: Colors.white,
                        shape: BorderDirectional(
                          bottom: BorderSide(color: Colors.black12, width: 1),
                        ),
                        child: new ListTile(
                          leading: new ClipOval(
                              child: Image.asset(
                            width: 80,
                            height: 80,
                            '${litems[position].image}',
                          )),
                          title: Padding(
                            padding: EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "${litems[position].title}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          subtitle: new Text(
                            "Stand :${litems[position].stand}",
                            style: TextStyle(color: Colors.black26, height: 2),
                          ),
                          trailing: Wrap(
                            children: [
                              new IconButton(
                                  icon: new Icon((litems[position].fav == false)
                                      ? Icons.verified_outlined
                                      : Icons.verified),
                                  onPressed: () {
                                    setState(() {
                                       litems[position].fav=!litems[position].fav;
                                     // if(litems[position].id==position){
                                       // _pressed = !_pressed;
                                        //print(litems[position].id.toString());
                                        //print(position.toString());
                                      //}
                                    });
                                  }),
                              new IconButton(
                                icon: new Icon(
                                    (litems[position].star == false) ? Icons.star_border : Icons.star,color:Color(0xff00c1c1)),
                                //disabledColor: Color(0xff00c1c1),
                                onPressed: () {
                                  setState(() {
                                    litems[position].star=!litems[position].star;
                                  });
                                },
                              ),
                            ],
                          ),
                          onTap: () {
                            //Navigator.push(
                            //   context,
                            // MaterialPageRoute(
                            //builder: (context) => DetailScreen()));
                          },
                        ),
                      );
                    }),
              ),
          ),
    );
  }
}
