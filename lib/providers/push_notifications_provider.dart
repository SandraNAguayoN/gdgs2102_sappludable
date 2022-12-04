import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushNotificationProvider {
  /*FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initNotifications(){
    _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then((token){
      print('==== FCM Token ====');
      print(token);
      //fAN2Khu8TeKgGdBlNZNeqw:APA91bEJzhpX_RAkJ1R4D5VMAOo3VuIZmMF8VlQA_mmZxhqoXCWOCJXbbyPTX4__3mDr6lDf-8qG1wgaY0ntFnq9iPRiBNkgjJTH9Heu5WZbFNgoOdRaWsKaY2lcBnnZbkHGq2QvAQpa

    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });


  }*/
}
