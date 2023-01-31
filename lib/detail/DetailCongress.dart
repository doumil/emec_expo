import 'package:animate_do/animate_do.dart';
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
        body: Row(
          children: [
            Expanded(
              flex: 1,
              child: Positioned(
                top: 0,
                  child: Container(
                child: Text("Tes1"),
              )),
            ),
          ],
        ));
  }
}
