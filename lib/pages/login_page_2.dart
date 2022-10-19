import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String id = "login_page";
  @override _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Color(0xffFE0000), //Color del fondo 1ra version
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Saludable \n para ti!'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Impact',
                  )
              ),
              SizedBox(
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      onTap:() {
                        setState(() {
                          print('2');
                        });
                      },
                    child: Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap:() {
                      setState(() {
                        print('1');
                      });
                    },
                    child: Text('Registrarse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox( //Espacio
                height: 15.0,
              ),
              _textFieldName(),
              SizedBox( //Espacio
                height: 15.0,
              ),
              _textFieldEmail(),
              SizedBox( //Espacio
                height: 15.0,
              ),
              _textFieldPassword(),
              SizedBox( //Espacio
                height: 15.0,
              ),
              _buttonSignup(),
            ],
          ),
        ),
        ),
        ),
    );
  }

  Widget _textFieldName() {
    return _textFieldGeneral(
      labelText: "Nombre",
      hintText: "Nombre(s) Apellido(s)",
      keyboardType: TextInputType.text,
      onChanged: (value) {},
      icon: Icons.person_outline,
    );
  }

  Widget _textFieldEmail() {
    return _textFieldGeneral(
      labelText: "E-mail",
      hintText: "example@email.com",
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      icon: Icons.email_outlined,
      controller: emailController,
    );
  }

  Widget _textFieldPassword() {
    return _textFieldGeneral(
      labelText: "Contraseña",
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {},
      icon: Icons.lock_outline_rounded,
      obscureText: true,
      controller: passwordController,
    );
  }

  /*signIn(String email, password) async {
    Map data = {
      'email' = email,
      'password' = password
    };
    var jsonData = null;
    var response = await http.post("http:127.0.0.1:8000/login", body: data);
    if(response.statusCode == 200){

    }
  }*/

  Widget _buttonSignup() {
    return
      //RaisedButton( está obsoleto, en su lugar usar elevated button
      ElevatedButton(

        style: ElevatedButton.styleFrom(
            primary: Color(0xff00A8E7),
            padding: EdgeInsets.symmetric(
              horizontal: 110,
              vertical: 20,
            ),
          shape: StadiumBorder(),
            textStyle: TextStyle(
              color:
              Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
            ),
        ),
        child: Text('Registrarse'),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          //signIn(emailController.text, passwordController.text);
        },
      );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

}

class _textFieldGeneral extends StatefulWidget {
  final String labelText;
  final String? hintText; //Puede ser nula la pista de dato
  final TextInputType? keyboardType; //Puede ser nulo tipo de dato
  final Function(String?)? onChanged; //para que acepte la función nula y tambien su tipo
  //final VoidCallback? onChanged; //para que acepte la función nula
  final IconData icon;
  final bool obscureText;
  final TextEditingController? controller;

  const _textFieldGeneral({
    required this.labelText, //Siempre será requerido
    this.hintText,
    required this.onChanged, //Siempre será requerido
    this.keyboardType,
    required this.icon, //Siempre será requerido
    this.obscureText = false,
    this.controller,
  });

  @override
  State<_textFieldGeneral> createState() => _textFieldGeneralState();
}

class _textFieldGeneralState extends State<_textFieldGeneral> {

  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        color: Colors.black, //Si se tiene un box decoration no de debe tener e color fuera de este sino enviará error
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          //suffixIcon: Icon(Icons.ac_unit),
          prefixIcon: Icon(widget.icon),
          labelText: widget.labelText,
          hintText: widget.hintText,
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
