## Branch Day5

Adding SingleChildScrollView, routes and Navigator
### [SingleChildScrollView]("https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html")

`SingleChildScrollView` lets you add flexibility in overflowing widget. This property has been added in login_page.dart. This avoid bottom overflow.

```dart
SingleChildScrollView(
  child: Column(
  ),
)
```

### Adding MyRoutes class

Making a class `MyRouted` in `utils/routes.dart`. This class has static members which allows us to use it's properties without initialising the class. 
```dart
class MyRoutes {
  static String loginRoute = "/login";
  static String homeRoute = "/";
}
```
`MyRoutes` class contains routes to different pages/screens. This can be directly used as routes. 

```dart
initialRoute: MyRoutes.loginRoute,
routes: {
  MyRoutes.homeRoute: (context) => const HomePage(),
  MyRoutes.loginRoute: (context) => const LoginPage(),
}
```
Adding the above code in `Material()` will assure the better routing.

In login page/screen, `login` button has a property `onPressed()` which is manipulated to navigate in `home` page/screen.
```dart
onPressed: () {
  Navigator.pushNamed(context, MyRoutes.homeRoute);
}
```
`Navigator.pushNamed()` takes  `context` and name of the route you want to navigate to, i.e. `MyRoutes.homeRoute` in this case.
