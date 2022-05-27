## Branch Day6

StatefullWidget, ElevatedButton, AnimatedContainer and delay (async, await) in nevigation. 
### [StatefullWidget]("https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html")

A `StatefullWidget` is a widget in which the data inside can be modified. 
```dart
class SampleWidget extends StatefulWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
`StatefullWidget` is implemented in `login_page.dart`

### [ElevatedButton]("https://api.flutter.dev/flutter/material/ElevatedButton-class.html")

`ElevatedButton` has different properties to impliment. In `onPressed()` we can push route.
```dart
ElevatedButton(
    style: TextButton.styleFrom(
    fixedSize: const Size(80, 40),
    ),
    onPressed: () {
    Navigator.pushNamed(context, MyRoutes.homeRoute);
    },
    child: const Text("Login"),
)
```
`ElevatedButton` can be removed and making custom button. 
### [AnimatedContainer]("https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html")

Using `InkWell` to give `AnimatedContainer` a properties to be clicked. It has `onTap()` with which we can navigate in different pages and change different properties.

`AnimatedContainer` needs duration to be defined as animation time.

```dart
bool changedButton = false;
InkWell(
    onTap: () async {
        setState(
        () {
            changedButton = true;
        },
        );
        // wait before nevagating to new page/screen
        await Future.delayed(const Duration(milliseconds: 600));
        Navigator.pushNamed(context, MyRoutes.homeRoute);
    }, // onTap
    child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: changedButton ? 40 : 80,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(
            changedButton ? 40 : 8,
        ),
        ),
        child: changedButton
            ? const Icon(
                Icons.done,
                color: Colors.white,
            )
            : const Text(
                "Login",
                style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                ),
        ),
    ),
),
```
