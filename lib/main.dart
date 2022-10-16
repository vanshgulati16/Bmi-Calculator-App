import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0A0E21),
        ),
        // colorScheme:
        //     ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        scaffoldBackgroundColor: Color(0xff0A0E21),
        // textTheme: TextTheme(
        //   bodyText2: TextStyle(color: Colors.white),
        // ),
      ),
      home: InputPage(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InputPage(),
      //   '/result': (context) => ResultsPage(),
      // },
    );
  }
}
