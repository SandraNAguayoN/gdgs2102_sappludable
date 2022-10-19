import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signInWithEmailAndPassword() async {
    try {
      final User? user = (await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ))
          .user;
      Get.snackbar('Hola', 'Has ingresado exitosamente');
      print('Autenticación exitosa');
      Future.delayed(
        Duration(seconds: 2),
            (){
          Get.toNamed("/menupage");
        },
      );

    } catch (e){
      Get.snackbar('Falló', 'Error: Revise su información',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }

  void signOut() async {
    final User? user = await _auth.currentUser;
    if(user == null){
      Get.snackbar('Sesión cerrada', 'No se ha iniciado sesión',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    _signOut();
    final String uid = user.uid;
    Get.snackbar('Cerró sesión', uid+'ha cerrado sesión exitosamente',
        snackPosition: SnackPosition.BOTTOM);
    Get.toNamed("/homepage");
  }


  void signInWithGoogle() async {
    try{
      UserCredential userCredential;

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      userCredential = await _auth.signInWithCredential(credential);
      //await FirebaseAuth.instance.signInWithCredential(credential);

      final user = userCredential.user;
      if(user != null && user.uid != null){
        Get.snackbar('Hola', 'Sign In ${user.uid} with Google');
        print('Ingresó correctamente');
      }
      Future.delayed(
          Duration(seconds: 2),
              (){
            Get.toNamed('/menupage');
          }

      );
    } catch (e) {
      print(e);
      Get.snackbar('Falló', 'Failed to sign in with Google: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}