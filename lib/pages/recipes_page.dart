import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';

class RecipesPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recetas'),
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
    );
  }
}