import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/models/menu_recipes_page.dart'; 
import 'package:sappludable/pages/menu_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RecipesPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  String idCategoria = "";
  String nombreCategoria = "";
  String imagenCategoria = "";
  RecipesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(contexto);
            Navigator.of(contexto).push(
              MaterialPageRoute(
                builder: (context) => MenuPage(),
              )
            );
          }
        ),
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
        child:new Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('categorias').orderBy("idCategoria").snapshots(),
            builder: (contexto, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  idCategoria = snapshot.data!.docs[index]["idCategoria"];
                  nombreCategoria = snapshot.data!.docs[index]["nombreCategoria"];
                  imagenCategoria = snapshot.data!.docs[index]["imagenCategoria"];
                  return new Card(
                    child: new Column(
                      children: <Widget>[
                        _CrearCard(contexto, idCategoria, nombreCategoria, imagenCategoria)
                      ],
                    ),
                  );
                }
              );
            }
          ),
        )
      )
    );
  }

  Widget _CrearCard(BuildContext context, String id, String nombre, String imagen){

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            MaterialButton(
              child: Image(
                image: AssetImage('assets/images/' + imagen)
              ),
              onPressed: (){
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MenuRecipesPage(id, nombre),
                  )
                );
              },
            ),
            Text(
              nombre, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            )
          ]
        ),
      ),
    );
  }
}