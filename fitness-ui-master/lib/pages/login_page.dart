import 'dart:convert';

import 'package:fitness_flutter/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var headers = '';
var authentication = '';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String usu = '';
  String cont = '';

  void ingresar(String usu, String cont) async {
    if (usu == "DenisVillalta@gmail.com" && cont == "Denis123" || usu == "analisis@gmail.com" && cont == "Analisis123"){
      await Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Tabs()));
    }
    else{
      return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('¡Alerta de sesión!'),
                  content:
                      Text('Usuario o contraseña incorrecto, intentelo de nuevo.'),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Ok'))
                  ],
                ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 1, vertical: 10),
          child: Stack(children: [
            // Login Form
            _loginForm(),
          ])),
    );
  }

  // 5
  Widget _loginForm() {
    return Center(
      child: GestureDetector(
        onTap: () {
          final FocusScopeNode focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus && focus.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Image.asset(
                  'assets/images/logo-gym.jpeg',
                  height: 200,
                ),
              ),
              const SizedBox(height: 20),
              _emailTextField(),
              const SizedBox(height: 15),
              _passwordTextField(),
              const SizedBox(height: 50),
              _bottonLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          controller: _usernameController,
          decoration: const InputDecoration(
            icon: Icon(
              Icons.email,
              size: 30,
            ),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electrónico',
            focusColor: Color.fromRGBO(243, 114, 33, 1),
            hintStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(243, 114, 33, 1)),
            labelStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
          ),
        ),
      );
    });
  }

  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: TextFormField(
          controller: _passwordController,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            icon: const Icon(
              Icons.lock_outline,
              size: 30,
            ),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
            hintStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            labelStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye_outlined,
                size: 30,
              ),
              onPressed: () => setState(() => showPassword = !showPassword),
            ),
          ),
          obscureText: showPassword,
        ),
      );
    });
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          child: Text('Iniciar Sesión',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18)),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
        ),
        color: Color.fromRGBO(10, 25, 61, 1),
        onPressed: () {
          usu = _usernameController.text;
          cont = _passwordController.text;

          if (usu != '' && cont != '') {
            ingresar(usu, cont);
          } else {
            showAlertDialog(BuildContext context) {
              // set up the button
              Widget okButton = TextButton(
                child: Text("OK"),
                onPressed: () {},
              );

              // set up the AlertDialog
              AlertDialog alert = AlertDialog(
                title: Text("Datos inválidos"),
                content: Text("Ingrese un correo o contraseña validos."),
                actions: [
                  okButton,
                ],
              );

              // show the dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alert;
                },
              );
            }
          }
        },
      );
    });
  }
}
