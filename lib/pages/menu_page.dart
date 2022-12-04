import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:sappludable/pages/calculator_imc_page.dart';
import 'package:sappludable/pages/recipes_page.dart';
import 'package:sappludable/pages/routines_page.dart';
import 'package:sappludable/pages/user_profile_page.dart';
import 'package:sappludable/pages/notifications_page.dart';
import 'package:sappludable/pages/credits_page.dart';
import 'package:sappludable/pages/foods_page.dart';

//Importaciones para notificaciones
import 'package:firebase_core/firebase_core.dart';
import 'package:sappludable/providers/firebase_notifications_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(MenuPage());
}

class MenuPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        actions: <Widget>[
          /*Container(
            height: 50,
            color: Colors.grey,
            child: TextButton.icon(
              icon: Icon(
                Icons.notifications_rounded,
                size: 24.0,
              ),
              label: Text(''),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),

              onPressed: () async {
                //controller.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );

              },
            ),
          ),*/
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
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.5, 0.9, 1.1],
            colors: [
              Colors.lightGreenAccent,
              Colors.greenAccent.shade400,
              Colors.tealAccent,
              Colors.tealAccent.shade400
            ],
          ),
        ),
        child: StreamBuilder(
          builder: (BuildContext context, snapshot) {
            return _buildMenuContent(context);
          },
        ),
      ),
    );
  }
}

Widget _buildMenuContent(context) {
  return ListView(padding: EdgeInsets.all(15.0), children: <Widget>[
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(children: <Widget>[
          Image(
            image: AssetImage('assets/images/character/greetings.gif'),
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
    SizedBox(height: 20.0),
    Card(
      borderOnForeground: true,
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Text(
              "Bienvenido a sAppludable",
              style: TextStyle(
                color: Colors.green,
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
                  Icons.favorite,
                  color: Colors.green,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "sAppludable es una app hecha con el objetivo de informarte y ayudarte a llevar un estilo de vida saludable.",
                    style:
                        TextStyle(fontStyle: FontStyle.normal, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
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
              "¿Sabías que...",
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
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Se debe realizar al menos 30 minutos diarios de actividad física.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
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
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "En México, aproximadamente 7 de cada 10 adultos tienen exceso de peso.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.question_mark, color: Colors.blue),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Alrededor de 30% de menores de edad tiene sobrepeso u obesidad.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
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
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "La falta de ejercicio causa tantas muerte a nivel mundial como el tabaco.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
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
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Comiendo regularmente en restaurantes multiplicas las posibilidades de acabar obeso.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Más del 30% de los cánceres podrían prevenirse evitando el tabaco y el alcohol, teniendo una dieta saludable y practicando alguna actividad física.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Dormir menos de 7 horas cada noche reduce la esperanza de vida.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Tomar un refresco al día aumenta en más de un  20% las posibilidades de sufrir diabetes de tipo 2.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "La ensalada César de McDonalds engorda más que una hamburguesa.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Caminar, puede reducir el riesgo de cáncer de mama en un 25%.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "La carne de pollo contiene ahora un 266% más grasa de la que tenía hace 40 años.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.question_mark,
                  color: Colors.blue,
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Text(
                    "Reír 100 veces es equivalente a 15 minutos de ejercicio en una bicicleta estática.",
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 15.0),
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
          /*onTap: () {
            //Cierra el navigation drawer antes
            Navigator.pop(context);

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => UserProfilePage()));
          },*/
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/images/profile_1.png'),
                  backgroundColor: Colors.white70,
                ),
                SizedBox(height: 12),
                Text(
                  'Bienvenid@',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
                /*Text(
                  'example@mail.com',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )*/
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
            const Divider(
              color: Colors.black54,
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
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Créditos'),
              onTap: () {
                //Cierra el navegador drawer antes
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CreditsPage(),
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
