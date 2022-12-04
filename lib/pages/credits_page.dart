import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/pages/menu_page.dart';

class CreditsPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  CreditsPage({Key? key}) : super(key: key);

  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Créditos'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(contexto);
              Navigator.of(contexto).push(MaterialPageRoute(
                builder: (context) => MenuPage(),
              ));
            }),
        actions: <Widget>[
          Builder(
            builder: (BuildContext context) {
              return TextButton.icon(
                icon: Icon(
                  Icons.logout_outlined,
                  size: 24.0,
                ),
                label: Text('Cerrar sesión'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  controller.signOut();
                },
              );
            },
          ),
        ],
      ),
      body: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5, 0.9, 1.1],
              colors: [
                Colors.indigo.shade50,
                Colors.indigo.shade100,
                Colors.indigo.shade200,
                Colors.indigo.shade300,
              ],
            ),
          ),
          child: StreamBuilder(builder: (BuildContext context, snapshot) {
            return _buildCreditsContent(context);
          })),
    );
  }

  Widget _buildCreditsContent(context) {
    return ListView(padding: EdgeInsets.all(15.0), children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo_2.png'),
              //height: 100,
              width: 360,
              colorBlendMode: BlendMode.darken,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ]),
          SizedBox(height: 5.0),
        ],
      ),
      SizedBox(height: 15.0),
      Card(
        borderOnForeground: true,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                "Miembros",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Quicksand',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Sandra Nohelia Aguayo Nuñez",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.pink,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Noemi Perez Vega",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Carolina Ramos Velazquez",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 20.0),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Image(
              image: AssetImage('assets/images/character/happy.gif'),
              //height: 100,
              height: 180.0,
              width: 180.0,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ]),
          SizedBox(height: 5.0),
        ],
      ),
      SizedBox(height: 10.0),
      Card(
        borderOnForeground: true,
        elevation: 10.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(children: <Widget>[
            Text(
              "©Copyright.",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0),
            ),
            Text(
              "All rights reserved 2022.",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0),
            ),
          ]),
        ),
      ),
    ]);
  }
}
