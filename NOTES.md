## Branch Day10

Adding ThemeData and Models

### [ThemeData]("https://api.flutter.dev/flutter/material/ThemeData-class.html")

Made a class `MyTheme` in `theme.dart`. Following code was put there.
```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
```
`AppBar` theme is also defined here.

This property is used directly in `main.dart` in `MaterialApp()` as 
```dart
MaterialApp(
  themeMode: ThemeMode.light,
  theme: MyTheme.lightTheme(),
  // home: HomePage(),
  debugShowCheckedModeBanner: false,
  initialRoute: MyRoutes.homeRoute,
  routes: {
    MyRoutes.homeRoute: (context) => const HomePage(),
    MyRoutes.loginRoute: (context) => const LoginPage(),
  },
)
```
This helps to organise the code.

### Models

Adding a `models` folder and adding `catalog.dart` to define the a model as a class `Item`.
```dart
class Item {
  final String id;
  final String name;
  final String desc;
  final num prince;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.prince,
      required this.color,
      required this.image});
}
```
Class `Item` has different properties and the constructor `Item()` is made in such a way that class need to be initialise with specific parameter passed. 