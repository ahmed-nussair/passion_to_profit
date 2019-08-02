import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

import '../user.dart';
import 'forgot_password_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: new Text("No Connectivity"),
            content: new Text("Please check your internert connectivity before you can proceed."),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.2),
                    BlendMode.dstATop
                ),
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/background.jpg')),
            ),
            child: ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: 5,
                            ),
                            labelText: 'Enter Your Email:',
                          ),
                          validator: (String value){
                            if (value.isEmpty) {
                              return "Please enter your name";
                            }if (value != 'nussair'){
                              return "Invalid input";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              gapPadding: 5,
                            ),
                            labelText: 'Enter Your Password:',
                          ),
                          obscureText: true,
                          validator: (value){
                            if (value.isEmpty) {
                              return "Please enter your name";
                            } else if (value != '1234'){
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                      ),

                    ],
                  ),
                ),
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.orange.shade900,
                    ),
                    child: FlatButton(
                        onPressed: (){
                          User.isGuest = false;
                          _formKey.currentState.validate();
                        },
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                    ),
                  ),
                ),
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.orange.shade900,
                    ),
                    child: FlatButton(
                        onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder:
                                      (context) => ForgotPasswordScreen()
                              )
                          );
                        },
                        child: Text(
                          'Forgot Your Password?',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                    ),
                  ),
                ),
                ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.rectangle,
                      color: Colors.orange.shade900,
                    ),
                    child: FlatButton(
                        onPressed: () async{
                          var connectivityResult = await Connectivity().checkConnectivity();
                          if (connectivityResult == ConnectivityResult.mobile ||
                              connectivityResult == ConnectivityResult.wifi) {
                            User.isGuest = true;
                            Navigator.of(context).pushReplacementNamed('/Home');
                          } else {
                            _showDialog(context);
                          }

                        },
                        child: Text(
                          'Proceed As a Guest',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
