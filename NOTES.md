## Branch Day5

Adding Images, Google Fonts, ElevatedButton, Login Page
### Adding google fonts

Install dependency by adding it in pubspec.yaml and add `google_fonts: ^3.0.1` in dependencies
import google_fonts in main.dart and modify code as follow

```dart
import 'package:google_fonts/google_fonts.dart';

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // home: HomePage(),
    );
}
```

### Adding Image

Add assets folder pubspec.yaml as 
```yaml
  assets:
    - assets/images/
```
mind indentation in pubspec.yaml

In flutter, Images can be added using various methos.
Here, `Image.asset()` has been used

```dart
Image.asset(
  "assets/images/undraw_secure_login_pdn4.png",
  fit: BoxFit.cover,
)
```
`fit` has different attributes which can be used as `BoxFit.cover` and many more. `BoxFit.cover` assures that image will stretched to fit the widget. 

### [Elevated Button](https://api.flutter.dev/flutter/material/ElevatedButton-class.html)

Refer to docs for better understanding.
```dart
ElevatedButton(
  child: const Text("Login"),
  onPressed: () {},
)
```

