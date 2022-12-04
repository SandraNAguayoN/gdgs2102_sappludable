import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/models/food.dart';
import 'package:sappludable/pages/foods_page.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MenuFoodsPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  String idCategoriaAlimento;
  String nombreCategoriaAlimento;
  MenuFoodsPage(this.idCategoriaAlimento, this.nombreCategoriaAlimento);
  String idDocumento = "";
  String idAlimento = "";
  String nombreAlimento = "";
  String imagenAimento = "";
  String descripcionAlimento = "";
  //FoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(nombreCategoriaAlimento),
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FoodsPage(),
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
        body: Container(
          child: Center(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('alimentos')
                    .where("idCategoriaAlimento",
                        isEqualTo: this.idCategoriaAlimento)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.85,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        //String idCategoria = snapshot.data!.docs[index]["idCategoria"];
                        idDocumento = snapshot.data!.docs[index].id;
                        idAlimento = snapshot.data!.docs[index]["idAlimento"];
                        nombreAlimento =
                            snapshot.data!.docs[index]["nombreAlimento"];
                        imagenAimento =
                            snapshot.data!.docs[index]["imagenAlimento"];
                        //descripcionAlimento = snapshot.data!.docs[index]["descripcionAlimento"];
                        return _buildFoodCard(
                            context,
                            idDocumento,
                            idAlimento,
                            nombreAlimento,
                            'assets/images/foods/' + imagenAimento,
                            64,
                            22,
                            1);
                      });
                }),
          ),
        ));
  }

  Widget _buildFoodCard(
      BuildContext context,
      String id,
      String idReceta,
      String name,
      String cardImage,
      int likes,
      int commentCount,
      int cardIndex) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
        child: Container(
            height: 400.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.2),
                  style: BorderStyle.solid,
                  width: 1.0,
                )),
            child: Stack(children: <Widget>[
              Positioned(
                right: -10.0,
                bottom: 3.0,
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Food(name, id),
                    ));
                  },
                  fillColor: Colors.white,
                  shape: CircleBorder(),
                  elevation: 4.0,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.green,
                      size: 17,
                    ),
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 125.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                          image: DecorationImage(
                              image: AssetImage(cardImage), fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                      child: Text(
                        name,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0),
                  ])
            ])));
  }
}
