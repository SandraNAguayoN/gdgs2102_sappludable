import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sappludable/pages/recipes_page.dart';

class Recipe extends StatelessWidget {
  //const Recipe({super.key});
  String name;
  String id;
  Recipe(this.name, this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RecipesPage(),
              )
            );
          }
        ),
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('recetas').doc(id).snapshots(),
          builder: (BuildContext context, snapshot){
            if (!snapshot.hasData) return CircularProgressIndicator();
            String nombre = snapshot.data!["nombreReceta"];
            String descripcion = snapshot.data!["descripcionReceta"];
            String calorias = snapshot.data!["calorias"];
            String carbohidratos = snapshot.data!["carbohidratos"];
            String fibraD = snapshot.data!["fibraD"];
            String proteinas = snapshot.data!["proteinas"];
            String gTotal = snapshot.data!["gTotal"];
            String gSaturada = snapshot.data!["gSaturada"];
            String gTrans = snapshot.data!["gTrans"];
            String colesterol = snapshot.data!["colesterol"];
            String sodio = snapshot.data!["sodio"];
            String porciones = snapshot.data!["porciones"];
            String tiempo = snapshot.data!["tiempo"];
            String imagen = snapshot.data!["imagenReceta"];
            List ingredientesList = [];
            List.from(snapshot.data!['ingredientes']).forEach((element){
              ingredientesList.add(element);
            });
            List pasosList = [];
            List.from(snapshot.data!['pasos']).forEach((element){
              pasosList.add(element);
            });
            return _buildRecipeContent(context, nombre, descripcion,calorias, carbohidratos, fibraD, 
            proteinas, gTotal, gSaturada, gTrans, colesterol, sodio, porciones, tiempo, imagen, ingredientesList, pasosList);
          }
        ),
      )
    );
  }

  Widget _buildRecipeContent(context, String nombre, String descripcion, String calorias, String carbohidratos, 
  String fibraD, String proteinas, String gTotal, String gSaturada, String gTrans, String colesterol, String sodio,
  String porciones, String tiempo, String imagen, List ingredientes, List pasos){
    return ListView(
      padding: EdgeInsets.all(15.0),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 230.0,
                      width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage("assets/images/"+imagen),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                  ]
                ),
              ]
            ),
            SizedBox(
              width: 5.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                    borderRadius: BorderRadius.circular(7.0),
                  elevation: 2.0,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.bolt, color: Colors.yellow),
                        Text(
                          calorias,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]
                    ),
                  )
                ),
                SizedBox(height: 5.0),
                Material(
                  borderRadius: BorderRadius.circular(7.0),
                  elevation: 2.0,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.timer, color: Colors.blue),
                        Text(
                          tiempo,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]
                    ),
                  )
                ),
                SizedBox(height: 5.0),
                Material(
                  borderRadius: BorderRadius.circular(7.0),
                  elevation: 2.0,
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.people, color: Colors.green),
                        Text(
                          porciones,
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Quicksand',
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]
                    ),
                  )
                )
              ]
            )
          ]
        ),
        SizedBox(height: 10.0),
        Card(
          elevation: 10,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text(
                  nombre,
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  descripcion,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'Quicksand',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.justify,
                )
              ]
            )
          ),
        ),
        SizedBox(height: 10.0),
        Card(
          borderOnForeground: true,
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "Ingredientes:",
                  style: TextStyle(
                    color: Colors.green,
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                for(var ingrediente in ingredientes) getingredientes(ingrediente)
              ]
            )
          ),
        ),
        Card(
          borderOnForeground: true,
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "Preparación:",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                for(var paso in pasos) getPasos(paso),
              ]
            )
          ),
        ),
        Card(
          borderOnForeground: true,
          elevation: 10.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "Información nutrimental:",
                  style: TextStyle(
                    color: Colors.orange,
                    fontFamily: 'Quicksand',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Calorías:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(calorias, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Carbohidratos:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(carbohidratos, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Fibra Dietética:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(fibraD, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Proteínas:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(proteinas, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Grasa Total:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(gTotal, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Grasa Saturada:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(gSaturada, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Grasa Trans:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(gTrans, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Colesterol:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(colesterol, textAlign: TextAlign.justify,)
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.api_rounded, color: Colors.green,),
                    Text("Sodio:", style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.justify,),
                    Text(sodio, textAlign: TextAlign.justify,)
                  ],
                ),
              ]
            )
          ),
        ),
      ],
    );
  }
  Widget getingredientes(String ingrediente){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:5.0, left: 5.0, right: 5, bottom: 20.0)),
        Row(
          children: <Widget>[
            Icon(Icons.check_box_rounded, color: Colors.green,),
            Flexible(
              child: Text(ingrediente, textAlign: TextAlign.justify,),
            )
          ],
        )
      ],
    );
  } 

  Widget getPasos(String paso){
    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top:5.0, left: 5.0, right: 5, bottom: 20.0)),
        Row(
          children: <Widget>[
            Icon(Icons.animation_rounded, color: Colors.purple,),
            Flexible(
              child: Text(paso, textAlign: TextAlign.justify,),
            ),
          ],
        )
      ],
    );
  }
}