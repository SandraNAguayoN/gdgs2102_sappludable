import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/pages/menu_page.dart';

class RoutinesPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  RoutinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rutinas'),
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
              Colors.limeAccent.shade100,
              Colors.limeAccent,
              Colors.limeAccent.shade400,
              Colors.limeAccent.shade700
            ],
          ),
        ),
        child: StreamBuilder(
          builder: (BuildContext context, snapshot) {
            return _buildRoutinesContent(context);
          },
        ),
      ),
    );
  }

  Widget _buildRoutinesContent(context) {
    return ListView(padding: EdgeInsets.all(15.0), children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(children: <Widget>[
            Image(
              image: AssetImage('assets/images/character/running.gif'),
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
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                "Rutina Tranquila",
                style: TextStyle(
                  color: Colors.yellow,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.directions_run,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "30 min de caminata diaria o a bicicleta.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.0),
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
                "Rutina Moderada",
                style: TextStyle(
                  color: Colors.orange,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.directions_run,
                    color: Colors.orange,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "1 hr de caminata diaria o a bicicleta.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.0),
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
                "Rutina Intensa",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.directions_run,
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "2 hrs de caminata diaria o a bicicleta.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
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
              image: AssetImage('assets/images/character/list.gif'),
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
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Text(
                "Agua",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.water_drop,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Tomar el agua suficiente para mantenerse hidratado.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.0),
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
                "Comidas",
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "3 comidas al día pero muy completas, si se tiene agenda apretada.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "5 comidas al día, 3 comidas principales y 2 meriendas.",
                      style: TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
      SizedBox(height: 10.0),
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
                "Horarios",
                style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Quicksand',
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Desayuno: Preferiblemente de entre 6-9 de la mañana.",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.schedule,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "1ra Merienda: Alrededor de las 12:00 p.m.",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.watch_later_outlined, color: Colors.blue),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Almuerzo: Entre las 2 y 4 de la tarde.",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "2da Merienda: Entre las 5 y 6 de la tarde.",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.schedule,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      "Cena: Recomendable de entre 6:30 p.m. y 8 p.m.",
                      style: TextStyle(
                          fontStyle: FontStyle.italic, fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    ]);
  }
}
