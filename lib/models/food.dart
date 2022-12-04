import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sappludable/pages/foods_page.dart';

class Food extends StatelessWidget {
  //const Food({super.key});
  String name;
  String id;
  Food(this.name, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(name),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FoodsPage(),
                ));
              }),
        ),
        body: Container(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('alimentos')
                  .doc(id)
                  .snapshots(),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                String nombre = snapshot.data!["nombreAlimento"];
                String descripcion = snapshot.data!["descripcionAlimento"];
                String cantidad = snapshot.data!["cantidad"];
                String calorias = snapshot.data!["calorias"];
                String imagen = snapshot.data!["imagenAlimento"];
                return _buildFoodContent(
                    context, nombre, descripcion, cantidad, calorias, imagen);
              }),
        ));
  }

  Widget _buildFoodContent(context, String nombre, String descripcion,
      String cantidad, String calorias, String imagen) {
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: 230.0,
                  width: MediaQuery.of(context).size.width -
                      MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      image: DecorationImage(
                          image: AssetImage("assets/images/foods/" + imagen),
                          fit: BoxFit.cover)),
                ),
              ]),
            ]),
            SizedBox(height: 5.0),
          ],
        ),
        SizedBox(height: 10.0),
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
              padding: EdgeInsets.all(20),
              child: Column(children: <Widget>[
                Text(
                  nombre,
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  descripcion,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Quicksand',
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.justify,
                )
              ])),
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
                    "Información",
                    style: TextStyle(
                      color: Colors.yellow.shade600,
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.dehaze,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Cantidad",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            cantidad,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                      SizedBox(width: 100),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.legend_toggle,
                            color: Colors.green,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Calorías",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            calorias,
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 15.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
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
                    "Más contenido proximamente.",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Quicksand',
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                ],
              )),
        ),
      ],
    );
  }
}
