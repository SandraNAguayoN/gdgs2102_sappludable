import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      /*appBar: AppBar(
        automaticallyImplyLeading: false, //Para quitar flecha de navegacion a otras pantallas
        title: Text(
          'Bienvenido a sAppludable',
        style: TextStyle(
          fontSize: 20,
        ),
        ),
      ),*/
      body: Container( //body: Center(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [
        0.1,
        0.5,
        0.9,
        1.1
      ],
      colors: [Colors.lightGreen, Colors.lightGreenAccent, Colors.lightBlueAccent, Colors.lightBlue],
    ),
    ),
    child: Center (
    child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            height: 100,
          ),

          Image(
              image: AssetImage(
                  'assets/images/logo_1.png'
              ),
          ),

          SizedBox(
            height: 100,
          ),


          Container(
            child: SignInButtonBuilder(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.green,
                    width: 1,
                    style: BorderStyle.solid
                  ),
              borderRadius: BorderRadius.circular(10)),
              icon: Icons.person_add,
              backgroundColor: Colors.blueAccent,
              text: 'Registrarse',
              fontSize: 20,
              onPressed: () => Get.toNamed("/registerpage"),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
          ),
          Row(
              children: <Widget>[
                Expanded(
                    child: Divider()
                ),

                Text(" O "),

                Expanded(
                    child: Divider()
                ),
              ]
          ),
          Container(
            child: SignInButtonBuilder(
              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Colors.blue,
                  width: 1,
                  style: BorderStyle.solid
              ), borderRadius: BorderRadius.circular(10)),
              icon: Icons.verified_user,
              backgroundColor: Colors.green,
              text: 'Iniciar sesión',
              fontSize: 20,
              onPressed: () => Get.toNamed("/loginpage"),
            ),
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
          ),
        ],
      ),
    ),
    ),
    );
  }
}