import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medzoom/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:medzoom/patients_screen.dart';
import 'package:medzoom/temp_data.dart';
import 'account_screen.dart';
import 'package:medzoom/patients_overview_screen.dart';

import 'neu.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MedZoom',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/patients': (context) => const PatientsScreen(),
        '/account': (context) => const AccountScreen(),
        '/overview': (context) => const PatientsOverviewScreen(),
        '/neu': (context) => const HomeScreen(),
      },
    ),
  );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  final String _ip = TempData.getIP();

    //Login Zeugs
  Future<bool> _loginSecure(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_ip/salt.php'),
        body: {'email': email},
      );

      if (response.body == 'Login failed when retrieving salt') {
        if (kDebugMode) {
          print(response.body);
          print('Login failed!');
        }
        return false;
      } else {
        // Salt von Response lesen
        final salt = response.body;
        // Password mit dem Salt hashen
        final hashedPassword =
            sha256.convert(utf8.encode('$salt$password')).toString();
        final loginResponse = await http.post(
          Uri.parse('$_ip/login_secure.php'),
          body: {'email': email, 'password': hashedPassword},
        );

        if (loginResponse.body == 'Login successful') {
          if (kDebugMode) {
            print('Login successful!');
          }
          return true;
        } else {
          if (kDebugMode) {
            print(loginResponse.body);
            print('Login failed!');
          }
          return false;
        }
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox.expand(
          child: Container(
            //Farbverlauf Hintergrund
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [ColorsSelect.medZoomA, ColorsSelect.medZoomB],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
              //Scrollable
              child: SingleChildScrollView(
                clipBehavior: Clip.hardEdge,
                //Column mit Image, Text, Text Field, Text Field, Text, Button und Button
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //StoreZoom Logo
                    const Image(
                      image: AssetImage(
                          "assets/images/Logo_MedZoom_Square_00.png"),
                      height: 180,
                      width: 180,
                      color: Colors.white,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    ),
                    //Login Text
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          color: ColorsSelect.textWhite,
                        ),
                      ),
                    ),
                    //Text Field für Email
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 0),
                      child: TextField(
                        controller: emailTextField,
                        obscureText: false,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: ColorsSelect.textWhite,
                        ),
                        //Animation
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                                color: ColorsSelect.textFieldEdgeWhite,
                                width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                                color: ColorsSelect.textFieldEdgeWhite,
                                width: 1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: const BorderSide(
                                color: ColorsSelect.textFieldEdgeWhite,
                                width: 1),
                          ),
                          labelText: "Email",
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 16,
                            color: ColorsSelect.textWhite,
                          ),
                          filled: true,
                          fillColor: ColorsSelect.textFieldFillTransparent,
                          isDense: false,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                        ),
                      ),
                    ),
                    //Text Field fürs Passwort
                    TextField(
                      controller: passwordTextField,
                      obscureText: true,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 16,
                        color: ColorsSelect.textWhite,
                      ),
                      //Animation
                      decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: ColorsSelect.textFieldEdgeWhite, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: ColorsSelect.textFieldEdgeWhite, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: ColorsSelect.textFieldEdgeWhite, width: 1),
                        ),
                        labelText: "Passwort",
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: ColorsSelect.textWhite,
                        ),
                        filled: true,
                        fillColor: ColorsSelect.textFieldFillTransparent,
                        isDense: false,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                      ),
                    ),
                    //Passwort vergessen Text
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/password');
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Passwort vergessen?",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: ColorsSelect.textWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //Row mit Einloggen und Registrieren Buttons
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          //Einloggen Button
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              onPressed: () async {
                                //Login abfrage

                                //TODO: if weg machen
                                if (emailTextField.text == '' &&
                                    passwordTextField.text == '') {
                                  Navigator.pushReplacementNamed(
                                      context, '/patients');
                                } else {
                                  final isLoggedIn = await _loginSecure(
                                      emailTextField.text,
                                      passwordTextField.text);

                                  //Wenn successful, dann gehe zum nächsten Screen
                                  if (isLoggedIn && context.mounted) {
                                    Navigator.pushReplacementNamed(
                                        context, '/patients');
                                  }
                                }
                              },
                              color: ColorsSelect.buttonAFill,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                    color: ColorsSelect.buttonABorder,
                                    width: 1),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: ColorsSelect.buttonAText,
                              height: 40,
                              minWidth: 130,
                              child: const Text(
                                "Einloggen",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                            width: 16,
                          ),
                          //Registrieren Button
                          Expanded(
                            flex: 1,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/registration');
                              },
                              color: ColorsSelect.buttonBFill,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(
                                    color: ColorsSelect.buttonBBorder,
                                    width: 1),
                              ),
                              padding: const EdgeInsets.all(16),
                              textColor: ColorsSelect.buttonBText,
                              height: 40,
                              minWidth: 130,
                              child: const Text(
                                "Registrieren",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
