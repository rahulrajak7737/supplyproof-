// import 'dart:js';

// import 'dart:js';



import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dashboard_producere.dart';
import 'dashboardlogistics.dart';
import 'dashboardwarehouse.dart';
import 'fleet_details.dart';
import 'login_screen.dart';
import 'logistics_qr_generator.dart';
import 'productdetails.dart';
import 'role.dart';
import 'signup_buyer.dart';
import 'signup_logistics.dart';
import 'signup_producer.dart';
import 'storage_details.dart';

import 'dropdown_widget.dart';
import 'location.dart';
import 'producer_qr_generator.dart';
import 'ware_qr_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'login_screen',
    debugShowCheckedModeBanner: false,
    routes: {
      'login_screen' :(context)=>Mylogin(),
      'signup_producer' :(context)=>MySignup(),
      'dashboard_producer' :(context)=>MydashboardProducer(),
      'role' :(context)=>Myrole(),
      'signup_buyer' :(context)=>MySignupbuyer(),
      'dashboardwarehouse' :(context)=>Mydashboardwarehouse(),
      'dashboardlogistics' :(context)=>Mydashboardlogistics(),
      'productdetails': (context) => Myproductdetails(),
      'signup_logistics': (context) => Register(),
      'fleet_details': (context) => Myfleetdetails(),
      'logistics_qr_generator': (context) => Myqrgenerator(),
      'storage_details': (context) => Mystoragedetails(),
      'logistics_qr_generator': (context) => Myqr1generator(),
      'location': (context) => MyLocation(),
      'producer_qr_generator': (context) => Myqr2generator(),
      'dropdown_widget': (context) => DatePickerTextField(),


    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


    );
  }
}





