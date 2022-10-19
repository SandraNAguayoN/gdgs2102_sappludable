import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sappludable/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false, //Para evitar el overflow de los elementos
      appBar: AppBar(
        title: Text(
          'Inicio de sesión',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {

          return Form(
              key: controller.formKey,
              child: Card(
              child: Container( //body: Center(
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
              child: Padding(
                padding: const EdgeInsets.all(
                    16.0
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.login_outlined,
                      size: 50.0,
                      color: Colors.blueAccent,
                    ),
                    Text(
                        'Inicio de sesión \n'.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Verdana',
                        )
                    ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black, //Si se tiene un box decoration no de debe tener e color fuera de este sino enviará error
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none, //Le quita la linea de abajo al field
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'ejemplo@mail.com',
                        hintStyle: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        prefixIcon: Icon(
                          Icons.mail_outlined,
                          color: Colors.white,
                        ),
                      ),
                      validator: (String? value){
                        if(value == null || value == '') return 'Por favor introduzca el email';
                        return null;
                      }
                    ),
                  ),

                    SizedBox( //Espacio
                      height: 15.0,
                    ),

                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black, //Si se tiene un box decoration no de debe tener e color fuera de este sino enviará error
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.text,
                      /*inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9]'),
                        ),
                      ],*/
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                      decoration: const InputDecoration(
                        border: InputBorder.none, //Le quita la linea de abajo al field
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(
                          color: Colors.blueAccent,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.white,
                        ),
                      ),
                      validator: (String? value){
                        if(value == null || value == '')
                          return 'Por favor introduzca la contraseña';
                        return null;
                      },
                      obscureText: true,
                    ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      
                      child: SignInButton(
                          Buttons.Email,
                          shape: StadiumBorder(),
                          text: 'Iniciar sesión',
                          onPressed: () async {
                          _.signInWithEmailAndPassword();
                          }
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 16.0),
                      alignment: Alignment.center,
                      child: SignInButton(
                          Buttons.Google,
                          text: 'Google',
                          onPressed: () async {
                            _.signInWithGoogle();
                          },
                      ),
                    ),
                  ],
                ),
              ),
          ),
            ),
          );
        },
      ),
    );
  }
}
