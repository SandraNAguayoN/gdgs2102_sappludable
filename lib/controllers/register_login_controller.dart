import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRegisterController extends GetxController{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool success = false;
  String? userEmail;

  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void register() async{
    final User? user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
    ))
        .user;
    if(user != null){
      success = true;
      print('Registrado correctamente');
      Future.delayed(
        Duration(seconds: 2),
          (){
          Get.toNamed("/menupage");
          },
      );
      userEmail = user.email;
    }
    else
    {
      success = false;
    }
  }
}