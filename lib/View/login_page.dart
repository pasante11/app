import 'package:app/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:colour/colour.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _nameKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(50),
            child: ListView(
              children: <Widget>[
                Container(
                   padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                   height: 80.0,
                   width: 80.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/logo.png'),
                        alignment: Alignment.center,
                        fit: BoxFit.fill,
                      ),
                    ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  height: 80,
                  child: TextFormField(
                    key: _nameKey,
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor introducir su usuario';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                    
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  width: 100.0,
                  height: 100.0,
                  child: TextFormField(
                    key: _passwordKey,
                    obscureText: true,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor introducir su contraseña';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                    color: Colour('#00783f'),
                    textColor: Colors.white,
                    onPressed: () {
                      // devolverá true si el formulario es válido, o falso si
                      // el formulario no es válido.
                      // if (_nameKey.currentState!.validate() && _passwordKey.currentState!.validate()) {
                      //   // Si el formulario es válido, queremos mostrar un Snackbar
                      //   Scaffold.of(context)
                      //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                      // }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
              },
                    child: const Text('INGRESAR'),
             ),
            ),
          ],
        )
      )
    );
  }

  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) return 'El dato es requerido';
    return null;
  }
  void _save() {
    // if (_nameKey.currentState()!.validate) print('Saved');
    print('Error');
  }
}