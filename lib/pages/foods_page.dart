import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/models/menu_foods_page.dart';
import 'package:sappludable/pages/menu_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FoodsPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  String idCategoria = "";
  String nombreCategoria = "";
  String imagenCategoria = "";
  FoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alimentos'),
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
                  Colors.tealAccent.shade100,
                  Colors.tealAccent,
                  Colors.tealAccent.shade400,
                  Colors.tealAccent.shade700
                ],
              ),
            ),
            child: new Center(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('categorias_alimentos')
                      .orderBy("idCategoriaAlimento")
                      .snapshots(),
                  builder: (contexto, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          idCategoria =
                              snapshot.data!.docs[index]["idCategoriaAlimento"];
                          nombreCategoria =
                              snapshot.data!.docs[index]["nombreCategoria"];
                          imagenCategoria =
                              snapshot.data!.docs[index]["imagenCategoria"];
                          return new Card(
                            child: new Column(
                              children: <Widget>[
                                _CrearCard(contexto, idCategoria,
                                    nombreCategoria, imagenCategoria)
                              ],
                            ),
                          );
                        });
                  }),
            )));
  }

  Widget _CrearCard(
      BuildContext context, String id, String nombre, String imagen) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
          MaterialButton(
            child: Image(
                image: AssetImage('assets/images/foods/categorias/' + imagen)),
            onPressed: () {
              Navigator.pop(context);
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MenuFoodsPage(id, nombre),
              ));
            },
          ),
          Text(
            nombre,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )
        ]),
      ),
    );
  }
}
