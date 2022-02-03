import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mans_voice/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
    home:HomePage(),
  ));
}

