## Branch Day6

Form and FormKey validation

### Removed Imkwell
Inkwell, used for login button, has been removed and ElevatedButton has been implemented.

### Form validation

Wrapping the TextFormField inside Form widget gives us the power to validate the data. For that we need to add a key for reference.

Add following line to define private variable of the class _LoginPageState
```Dart
final _formkey = GlobalKey<FormState>();
```
use this `_formkey` as argument for `key` in `Form` widget. 
```dart
Form(
    key: _formkey,
    child: Padding(
    padding:
        const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
            children: [
            // username
                TextFormField(
                    decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Enter username",
                    labelText: "Username",
                    ),
                    onChanged: (value) {
                    _name = value;
                    setState(() {});
                    },
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                            return "Username can not be empty";
                        }
                        return null;
                    },
                ),
                const SizedBox(
                    height: 10,
                ),
                // password
                TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                    icon: Icon(Icons.key),
                    hintText: "Enter password",
                    labelText: "Password",
                    ),
                    validator: (value) {
                        if (value == null || value.isEmpty) {
                            return "Password can not be empty";
                        } else if (value.length < 6) {
                            return "Password can not be less than 6 character";
                        }
                        return null;
                    },
                ),
                const SizedBox(
                    height: 30,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                    fixedSize: const Size(80, 40),
                    ),
                    onPressed: () {
                        if (_formkey.currentState!.validate()) {
                            Navigator.pushNamed(context, MyRoutes.homeRoute);
                        }
                    },
                    child: const Text("Login"),
                ),
            ],
        ),
    ),
),
```
In `TextFormField`, validator has been added which return the instant of string that has been placed inside the `TextFormField`. By using an API we can check if `username` and `password` are valid. and then, validation has been added in `onPressed()` function in `ElevatedButton` widget.  
```dart
onPressed: () {
    if (_formkey.currentState!.validate()) {
        Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
},
```
This will let you navigate only if form is valid. 