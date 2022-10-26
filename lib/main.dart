import 'package:flutter/material.dart';
import 'package:flutter_market_app/view/main/home_view.dart';

/*
Created by BERDIYEV SHEKHROZ on 16:31:59 26.10.2022
© 2022 
*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// Dio bilan ishlash  *******************************************************************************************************************

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:UsersView(),
    );
  }
}
