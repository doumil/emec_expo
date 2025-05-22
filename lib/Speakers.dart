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
    var sp1=Speakers("Hassan", "EL OUARDY", "", "Co-Founder of Shipsen",
        "assets/speakers/speakers2024/1.jpeg");
    litems.add(sp1);
    var sp2=Speakers("Reda", "AOUNI", "",
        "Co-Founder of Shipsen",
        "assets/speakers/speakers2024/2.png");
    litems.add(sp2);
    var sp3=Speakers("Abderrahmane ", "HASSANI IDRISSI", "", "CEO Shopyan, Directeur de Projet & Programme Neoxecutive",
        "assets/speakers/speakers2024/3.png");
    litems.add(sp3);
    var sp4=Speakers("Yassine", "ZAIM", "", "Ingenieur informatique , Paiement en ligne Expert E-commerce",
        "assets/speakers/speakers2024/4.png");
    litems.add(sp4);
    var sp5=Speakers("Abderrazak", "YOUSFI", "",
        "CEO of Media Digital Invest",
        "assets/speakers/speakers2024/5.png");
    litems.add(sp5);
    var sp6=Speakers("Mohammed", "TAHARAST", "", "Co-Founder & Head Of Customer Service at Shopyan",
        "assets/speakers/speakers2024/6.png");
    litems.add(sp6);
    var sp7=Speakers("Jalal", "AAOUITA", "",
        "Serial Entrepreneur, Startup Enthusiast & Social Militant",
        "assets/speakers/speakers2024/7.png");
    litems.add(sp7);
    var sp8=Speakers("Imad ", "EL MANSOUR ZEKRI", "", "Founder & CEO of Cathedis",
        "assets/speakers/speakers2024/8.png");
    litems.add(sp8);
    var sp9=Speakers("Salah Eddine", "MIMOUNI", "",
        "PhD, Conférencier International et Expert en Marketing Digital",
        "assets/speakers/speakers2024/9.png");
    litems.add(sp9);
    var sp10=Speakers("Hassan ", "AANBAR", "", "Co-Founder of PrimeCOD",
        "assets/speakers/speakers2024/10.png");
    litems.add(sp10);
    var sp11=Speakers("Adil", "BARRA","","Co-Founder of PrimeCOD",
        "assets/speakers/speakers2024/11.png");
    litems.add(sp11);
    var sp12=Speakers("Yassine", "WAHABI", "",
        "Founder of SPAYPO & E-commerce Expert",
        "assets/speakers/speakers2024/12.png");
    litems.add(sp12);
    var sp13=Speakers("Ayoub", "ZERI", "","Founder & CEO of ONESSTA",
        "assets/speakers/speakers2024/13.png");
    litems.add(sp13);
    var sp14=Speakers("Noureddine", "KHITI", "", "Chief Executive Officer at Codshopy.com",
        "assets/speakers/speakers2024/14.png");
    litems.add(sp14);
    var sp15=Speakers("Mohammed", "MESTOUR", "",
        "COD in Africa Expert, Co-Founder of X10LEAD, Co-Founder of growad.ma & E-commerce consultant",
        "assets/speakers/speakers2024/15.png");
    litems.add(sp15);
    var sp16=Speakers("Youness", "AbdeEL BAKALIlmajid", "", "Entrepreneur, Multi 7-figure ecommerce stores, Co-Founder of GROWAD & Co-Founder of X10LEAD"
        ,"assets/speakers/speakers2024/16.png");
    litems.add(sp16);
    var sp17=Speakers("Imane ", "ID SALEM", "", "Co-Founder & CEO of AfricaShip",
        "assets/speakers/speakers2024/17.png");
    litems.add(sp17);
    var sp18=Speakers("Mamoon", "AL SABBAGH", "", "Co-Founder & CEO of NINJA SELLERS",
        "assets/speakers/speakers2024/18.png");
    litems.add(sp18);
    var sp19=Speakers("Samir ", "EL ATCHI", "", "Founder of eComya",
        "assets/speakers/speakers2024/19.png");
    litems.add(sp19);
    var sp20=Speakers("Gala ", "GRIGOREVA", "", "CMO at Adsterra Network",
        "assets/speakers/speakers2024/20.png");
    litems.add(sp20);
    var sp21=Speakers("Rida ", "CHADLI", "", "Founder of eComya",
        "assets/speakers/speakers2024/21.png");
    litems.add(sp21);
    var sp22=Speakers("Julien ", "GUYARD", "", "Fondateur de Caméléon Média - Partenaire Stratégique de Sendit",
        "assets/speakers/speakers2024/22.png");
    litems.add(sp22);
    var sp23=Speakers("Youssef ", "YATIM", "", "Project manager at Sendit",
        "assets/speakers/speakers2024/23.png");
    litems.add(sp23);
    var sp24=Speakers("Jalal ", "BADER", "", "CFounder & CEO of high delivery And MegaTech",
        "assets/speakers/speakers2024/24.png");
    litems.add(sp24);
    var sp25=Speakers("Moncef ", "FETTAH", "", "CCo-Founder & CEO of Sandbox",
        "assets/speakers/speakers2024/25.png");
    litems.add(sp25);
    var sp26=Speakers("Mariam ", "GUERNI", "", "Social Media Manager at Sandbox",
        "assets/speakers/speakers2024/26.png");
    litems.add(sp26);
    var sp27=Speakers("Ayoub ", "COPYWRITER", "", "Expert in Copywriting & Ecommerce Videos Ads",
        "assets/speakers/speakers2024/27.png");
    litems.add(sp27);
    var sp28=Speakers("Noureddine ", "IOUIRI", "", "Founder of ECOM FIGHTERS",
        "assets/speakers/speakers2024/28.png");
    litems.add(sp28);
    var sp29=Speakers("Othmane ", "BLIT", "", "Import-Export Expert Co-Founder & CEO of ECOVERSA COD in Morocco Specialist",
        "assets/speakers/speakers2024/29.png");
    litems.add(sp29);
    var sp30=Speakers("Allal ", "MARRAKCHI", "", "Fondateur de YOUPACK et Expert en opérations e-commerce",
        "assets/speakers/speakers2024/30.png");
    litems.add(sp30);
    var sp31=Speakers("Fadwa ", "JALIL", "", "Responsable qualité et formation",
        "assets/speakers/speakers2024/31.png");
    litems.add(sp31);
     var sp32=Speakers("Dr. Abdelmajid ", "CHARRASS", "", "Ex-Directeur Régional du Centre Monétique Interbancaire (10ans) Cofondateur de la plateforme NSAYBLIK.com",
         "assets/speakers/speakers2024/32.png");
    litems.add(sp32);
    var sp33=Speakers("Mohammed ", "EL MAKHROUBI", "", "Radio & Podcast Presenter",
        "assets/speakers/speakers2024/33.png");
    litems.add(sp33);
    var sp34=Speakers("Haimond ", "NEINKHA GBOHO", "", "Founder & CEO of Tuwshiyah Agency",
        "assets/speakers/speakers2024/34.png");
    litems.add(sp34);
    var sp35=Speakers("Said ", "BOUBAKRI", "", "Expert in E-Commerce & Digital Marketing Consultant",
        "assets/speakers/speakers2024/35.png");
    litems.add(sp35);
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
     /*                     Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailSpeakersScreen()));*/
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
