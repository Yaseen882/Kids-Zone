import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practise/Presentation/home_page.dart';
import 'package:practise/Presentation/sign_in.dart';
import 'package:practise/Repository/Firebase/firebase_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyHomePage());
}


