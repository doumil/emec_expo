import 'dart:convert';
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
  List<ExhibitorsClass> litems = [];
  bool isLoading = true;
  void initState() {
    litems.clear();
    isLoading = true;
    _loadData();
    super.initState();
  }
_click(){

}
  _loadData() async {
    // var url = "http://192.168.8.100/emecexpo/loadexhibitors.php";
    //var res = await http.post(Uri.parse(url));
    //List<ExhibitorsClass> exh = (json.decode(res.body) as List)
    //  .map((data) => ExhibitorsClass.fromJson(data))
    //.toList();
    var ex1 = ExhibitorsClass('TECHNOPARK', 'ED240', '', '', '', '', 'assets/partners/technopark.png');
    litems.add(ex1);
    var ex2 = ExhibitorsClass('AMMC', 'EF300', '', '', '', '', 'assets/partners/ammc.png');
    litems.add(ex2);
    var ex3 = ExhibitorsClass('MEDI 1 RADIO', 'RZ901', '', '', '', '', 'assets/partners/mediradio.png');
    litems.add(ex3);
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

    return Scaffold(
          extendBodyBehindAppBar: true,
          body: isLoading == true
              ? Center(
                  child: SpinKitThreeBounce(
                  color: Color(0xff00c1c1),
                  size: 30.0,
                ))
              : Container(
            color: Colors.white,
                child: new ListView.builder(
                    itemCount: litems.length,
                    itemBuilder: (_, int position) {
                      return new Card(
                        color: Colors.white,
                        shape: BorderDirectional(
                          bottom:BorderSide(color: Colors.black12, width: 1),
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
                                icon: new Icon(Icons.verified_outlined),
                                highlightColor: Colors.pink,
                                onPressed: _click(),
                              ),
                              new IconButton(
                                icon: new Icon(Icons.star_border),
                                disabledColor: Color(0xff00c1c1),
                                onPressed: _click(),
                              ),
                            ],
                          ),
                          onTap: () {
                           Navigator.push(
                                context,
                                MaterialPageRoute(
                                builder: (context) => DetailScreen()));
                          },
                        ),
                      );
                    }),
              ),
        );
  }
}
