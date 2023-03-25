import 'package:flutter/material.dart';
import 'package:off_pay/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OFF-PAY',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const RegisterScreen(),
    );
  }
}
