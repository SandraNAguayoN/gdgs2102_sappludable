import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sappludable/controllers/login_controller.dart';
import 'package:decimal/decimal.dart';
import 'dart:ui' as ui;

class ImcCalculatorPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  ImcCalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalcularIMC();
  }
}

class CalcularIMC extends StatefulWidget {
  State<StatefulWidget> createState() => _Calculadora();
}

class _Calculadora extends State<CalcularIMC> {
  final controller_Peso = TextEditingController();
  final controller_Estatura = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  final d = Decimal;
  double alturaContenedor = 50.0;
  Color colorContenedor1 = Color(0xFFf01DFD7);
  Color colorContenedor2 = Color(0xFFf04B4AE);
  String mostrarIMC = "";
  String pesoSugerido = "";

  //Calcular el peso en mujeres
  void PesoIdealM(){
    int pesoIdeal = 21;
    int decimales = 2;
    num fad = pow(10, decimales);

    //Validar si existen campos vacios

    if(my_form_key.currentState!.validate()){
      double peso = double.parse(controller_Peso.text);
      double estatura = double.parse(controller_Estatura.text);
      double d = peso / (((estatura)/100) * ((estatura)/100));
      d = (d * fad).round() / fad;

      //Formula para sugerir el peso de la persona
      double sugerido = (pesoIdeal * peso) /d;
      sugerido = (sugerido * fad).round() / fad;

      setState(() {
        mostrarIMC = "Tu IMC es : $d";
      });
      
      if(d < 20){
        setState(() {
          pesoSugerido = "Te encuentras en peso bajo. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(165, 165, 165, 1);
          colorContenedor2 = Color.fromARGB(255, 118, 115, 115);
        });
      }else if(d >= 20 && d <= 25  ){
        setState(() {
          pesoSugerido = "Tu peso es normal.";
          alturaContenedor = 50.0;
          colorContenedor1 = Color.fromRGBO(112, 173, 71, 1);
          colorContenedor2 = Color.fromARGB(255, 71, 124, 36);
        });
      }else if(d >= 25.1 && d <= 30){
        setState(() {
          pesoSugerido = "Te encuentras en sobrepeso. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(255, 192, 0, 1);
          colorContenedor2 = Color.fromARGB(228, 255, 191, 0);
        });
      }else if(d >= 30.1 && d <= 40){
        setState(() {
          pesoSugerido = "Te encuentras en obesidad. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(237, 125, 49, 1);
          colorContenedor2 = Color.fromARGB(211, 237, 124, 49);
        });
      }else if(d > 40){
        setState(() {
          pesoSugerido = "Te encuentras en obesidad mórbida. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(255, 192, 0, 1);
          colorContenedor2 = Color.fromARGB(228, 255, 191, 0);
        });
      }
    }
  }

  //Calcular el peso en hombres
  void PesoIdealH(){
    int pesoIdealH = 24;
    int decimales = 2;
    num fad = pow(10, decimales);

    //Validar si existen campos vacios

    if(my_form_key.currentState!.validate()){
      double peso = double.parse(controller_Peso.text);
      double estatura = double.parse(controller_Estatura.text);
      double d = peso / (((estatura)/100) * ((estatura)/100));
      d = (d * fad).round() / fad;

      //Formula para sugerir el peso de la persona
      double sugerido = (pesoIdealH * peso) /d;
      sugerido = (sugerido * fad).round() / fad;

      setState(() {
        mostrarIMC = "Tu IMC es : $d";
      });
      
      if(d < 20){
        setState(() {
          pesoSugerido = "Te encuentras en peso bajo. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(165, 165, 165, 1);
          colorContenedor2 = Color.fromARGB(255, 118, 115, 115);
        });
      }else if(d >= 20 && d <= 27  ){
        setState(() {
          pesoSugerido = "Tu peso es normal.";
          alturaContenedor = 50.0;
          colorContenedor1 = Color.fromRGBO(112, 173, 71, 1);
          colorContenedor2 = Color.fromARGB(255, 71, 124, 36);
      });
      }else if(d >= 27.1 && d <= 30){
        setState(() {
          pesoSugerido = "Te encuentras en sobrepeso. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(255, 192, 0, 1);
          colorContenedor2 = Color.fromARGB(228, 255, 191, 0);
        });
      }else if(d >= 30.1 && d <= 40){
        setState(() {
          pesoSugerido = "Te encuentras en obesidad. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(237, 125, 49, 1);
          colorContenedor2 = Color.fromARGB(211, 237, 124, 49);
        });
      }else if(d > 40){
        setState(() {
          pesoSugerido = "Te encuentras en obesidad mórbida. \n El peso ideal es de : $sugerido kg";
          alturaContenedor = 100.0;
          colorContenedor1 = Color.fromRGBO(255, 192, 0, 1);
          colorContenedor2 = Color.fromARGB(228, 255, 191, 0);
        });
      }
    }
  }

  //Layout o diseño de la pantalla

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Calcular IMC'),
          backgroundColor: Color(0xFFf01DFD7),
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
        body: Form(
            key: my_form_key,
            child: SingleChildScrollView(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                    children: <Widget>[
                      Container(
                        width: 500,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Color(0xFFf01DFD7),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(80),
                                bottomLeft: Radius.circular(80)
                            )
                        ),
                        child: Stack(
                          children: <Widget>[
                            Align(alignment: Alignment.center,
                              child: new Image(
                                width: 100.0,
                                height: 80,
                                image: new AssetImage('assets/images/bascula.png'),
                              ),)
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 40),
                          child: Column(
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  height: 50,
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(color: Colors.black, blurRadius: 5)
                                      ]
                                  ),
                                  child: TextFormField(
                                    controller: controller_Peso,
                                    validator: (value){
                                      if(value != null && value.isEmpty) return "Ingresa el peso en Kg.";
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Peso Kg",
                                        icon: Icon(Icons.account_balance_wallet,
                                            color: Colors.purpleAccent)
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                Divider(),
                                Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 200,
                                            height: 50,
                                            padding: EdgeInsets.all(7),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(color: Colors.black, blurRadius: 5)
                                                ]
                                            ),
                                            child: TextFormField(
                                              controller: controller_Estatura,
                                              validator: (value){
                                                if(value != null && value.isEmpty) return "Ingresa la estatura en cm.";
                                              },
                                              decoration: InputDecoration(
                                                  hintText: "Estatura cm",
                                                  icon: Icon(Icons.present_to_all,
                                                      color: Colors.blueAccent)
                                              ),
                                              keyboardType: TextInputType.number,
                                            ),
                                          ),
                                          Divider(
                                            height: 30.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              TextButton(
                                                onPressed: PesoIdealM,
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                                  foregroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(30.0)
                                                      )
                                                  ),
                                                ),
                                                child: Column(
                                                  children: <Widget>[Icon(Icons.person), Text('Mujer')],
                                                ),
                                              ),
                                              VerticalDivider(),
                                              TextButton(
                                                onPressed: PesoIdealH,
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                                                  foregroundColor: MaterialStateProperty.all(Colors.blueAccent),
                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                      RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(30.0)
                                                      )
                                                  ),
                                                ),
                                                child: Column(
                                                  children: <Widget>[Icon(Icons.person), Text('Hombre')],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            height: 40.0,
                                          ),
                                          //caja de resultado
                                          Container(
                                            height: 50.0,
                                            width: 300,
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [Color(0xFFf04B4AE), Color(0xFFf81F7F3)]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                            ),
                                            //Se crea el resultado del TextFormField
                                            child: Center(
                                              child: Text(
                                                mostrarIMC,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 15.0,
                                          ),
                                          Container(
                                            height: alturaContenedor,
                                            width: 300,
                                            padding: (EdgeInsets.all(10.0)),
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [colorContenedor1, colorContenedor2]
                                                ),
                                                borderRadius: BorderRadius.all(Radius.circular(15))
                                            ),
                                            //Se crea el resultado del TextFormField
                                            child: Center(
                                              child: Text(
                                                pesoSugerido,
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                          ),
                                          new Container(
                                            padding: EdgeInsets.all(2.0),
                                            child: Stack(
                                                children: <Widget>[
                                                  Align(
                                                    child: new Image(
                                                      width: 300.0,
                                                      height: 200.0,
                                                      image: new AssetImage('assets/images/imc.png'),
                                                    ),
                                                  )
                                                ]
                                            ),
                                          ),
                                          SizedBox( //Espacio
                                            height: 100.0,
                                          ),
                                        ]
                                    )
                                )
                              ]
                          )
                      )
                    ]
                )
            )
        )
    );
  }
}
