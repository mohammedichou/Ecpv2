import 'package:flutter/material.dart';


class Formulaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: FormulaireStateful()
    );
  }
}

/// Stateful formulaire
class FormulaireStateful extends StatefulWidget {
  @override
  FormulaireStatefulState createState() {
    return FormulaireStatefulState();
  }
}

/// Classe qui accueille les données du formulaire
class FormulaireStatefulState extends State<FormulaireStateful> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffKey = GlobalKey<ScaffoldState>();

  String _email, _password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffKey,
      backgroundColor: Colors.white,
      body:Stack(
        fit:StackFit.expand,
        children: <Widget>[
          Theme(
            isMaterialAppTheme: true,
            data: ThemeData(brightness: Brightness.dark,inputDecorationTheme: InputDecorationTheme(labelStyle: TextStyle(color:Colors.green,fontSize: 22.0))),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.fastfood,size: 150,color: Colors.green),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: _formKey,
                      autovalidate: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            onSaved: (input) => _email = input,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Nom de compte",
                              fillColor: Colors.black,
                            ),
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.black),
                            onSaved: (input) => _password = input,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                            },
                            decoration: InputDecoration(
                              labelText: "Mot de passe",
                              fillColor: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 20
                            )
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child:MaterialButton(
                                    height: 50.0,
                                    minWidth: 150.0,
                                    color: Colors.lightGreen,
                                    splashColor: Colors.teal,
                                    textColor: Colors.white,
                                    child: Text("Connexion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                    onPressed: () {
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        print("Connexion...");
                                        print(_formKey.currentWidget);
                                          // If the form is valid, we want to show a Snackbar
                                    },
                                  )),
                                  Padding(
                                    padding: EdgeInsets.only(left: 45),
                                  ),
                                  Expanded(
                                    child: MaterialButton(
                                      height: 50.0,
                                      minWidth: 150.0,
                                      color: Colors.green[600],
                                      splashColor: Colors.teal,
                                      textColor: Colors.white,
                                      child: Text("Créer un compte",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
                                      onPressed: () {
                                        // Validate will return true if the form is valid, or false if
                                        // the form is invalid.
                                        // If the form is valid, we want to show a Snackbar
                                      }
                                    ),
                                  )
                              ]),
                          ]
                         )
                        )
                      )
                  ],
                )
              ),
            ],
          ),
        );
      }
}
