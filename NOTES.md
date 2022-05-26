### How to fix minimum width and height of desktop app

Install dependency by adding it in pubspec.yaml and add `desktop_window: ^0.4.0` in dependencies
import desktop_window in main.dart and modify code as follow

```dart
import 'package:desktop_window/desktop_window.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DesktopWindow.setMinWindowSize(const Size(500, 800));
  runApp(const MyApp());
}
```