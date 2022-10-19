import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/pages/calculator_imc_page.dart';
import 'package:sappludable/pages/recipes_page.dart';
import 'package:sappludable/pages/routines_page.dart';
import 'package:sappludable/pages/user_profile_page.dart';

import 'foods_page.dart';

class MenuPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
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
      drawer: const NavigationDrawer(),
      /*body: Center(
        child: Text('Menu page',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.black,
          ),
        ),
      ),*/
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            //Cierra el navigation drawer antes
            Navigator.pop(context);

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserProfilePage()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: NetworkImage(''),
                ),
                SizedBox(height: 12),
                Text(
                  'Bienvenido(a)',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                Text(
                  'example@mail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.calculate_outlined),
                title: const Text('Calculadora IMC'),
                onTap: () {
                  //Cierra el navegador drawer antes
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ImcCalculatorPage(),
                  ));
                },
            ),
            ListTile(
              leading: const Icon(Icons.people_outline),
              title: const Text('Rutinas'),
              onTap: () {
                //Cierra el navegador drawer antes
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RoutinesPage(),
                ));
              },
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              leading: const Icon(Icons.percent_outlined),
              title: const Text('Información de Alimentos'),
              onTap: () {
                //Cierra el navegador drawer antes
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => FoodsPage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.emoji_food_beverage_outlined),
              title: const Text('Recetas saludables'),
              onTap: () {
                //Cierra el navegador drawer antes
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RecipesPage(),
                ));
              },
            ),
            const Divider(
              color: Colors.black54,
            ),

          ],
        ),
      );
}
