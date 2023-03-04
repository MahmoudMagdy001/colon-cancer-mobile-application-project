// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, library_private_types_in_public_api, unused_local_variable

import 'package:ColonCancer/layout/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../model/Home_model.dart';
import '../../model/google_signin.dart';
import '../../shared/components/button/button.dart';
import '../../shared/components/navigator_push_replacment/navigator_replacment.dart';
import '../../shared/components/text/text.dart';
import '../../shared/components/text_form_field/text_form_field.dart';
import '../../shared/styles/colors.dart';

class authModule extends StatefulWidget {
  @override
  _authModule createState() => _authModule();
}

class _authModule extends State<authModule>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  GlobalKey<FormState> formkeylogin = GlobalKey<FormState>();

  var emailControllerSignup = TextEditingController();
  var passwordControllerSignup = TextEditingController();
  var nameControllerSignup = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  late String yourName;
  late String email;
  late String password;

  late String emaillogin;
  late String passwordlogin;

  bool isPasswordSignup = false;
  bool isPasswordLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        title: Row(
          children: [
            Image.asset(
              'images/colon-login.ico',
              height: 60,
              fit: BoxFit.cover,
            ),
            Text(
              'COLON CANCER',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,

          // ignore: prefer_const_literals_to_create_immutables
          tabs: [
            Tab(text: 'SIGN UP'),
            Tab(text: 'SIGN IN'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Create your account.',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.7)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          elevation: 0.0,
                          backgroundColor: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(Logos.google),
                          const SizedBox(width: 15),
                          const Text(
                            'Sign up with Google',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                        navigatePushReplacementTo(context, const HomeModel());
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(
                            text: 'or',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    customTextFormField(
                      type: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Your name must not be empty';
                        }
                        return null;
                      },
                      controller: nameControllerSignup,
                      label: 'Your name',
                      prefix: Icons.person,
                      onChange: (value) {
                        yourName = value;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    customTextFormField(
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-mail must not be empty';
                        }
                        return null;
                      },
                      controller: emailControllerSignup,
                      label: 'E-Mail',
                      prefix: Icons.email,
                      onChange: (value) {
                        email = value;
                        print(email);
                      },
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: passwordControllerSignup,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isPasswordSignup,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (value) {
                        password = value;
                        print(password);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: isPasswordSignup
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordSignup = !isPasswordSignup;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      label: 'SIGNUP',
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          _signUp();
                          nameControllerSignup.text = '';
                          passwordControllerSignup.text = '';
                          emailControllerSignup.text = '';
                        }
                      },
                      color: allColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formkeylogin,
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Text(
                      'Sign in to your account.',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.7)),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          elevation: 0.0,
                          backgroundColor: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(Logos.google),
                          const SizedBox(width: 15),
                          const Text(
                            'Sign in with Google',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                        navigatePushReplacementTo(context, const HomeModel());
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: CustomText(
                            text: 'or',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.5,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    customTextFormField(
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'E-mail must not be empty';
                        }
                        return null;
                      },
                      controller: emailController,
                      label: 'E-mail',
                      prefix: Icons.email,
                      onChange: (value) {
                        emaillogin = value;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: isPasswordLogin,
                      onFieldSubmitted: (String value) {
                        print(value);
                      },
                      onChanged: (value) {
                        passwordlogin = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: isPasswordLogin
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              isPasswordLogin = !isPasswordLogin;
                            });
                          },
                        ),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomButton(
                      label: 'Sign in ',
                      onPressed: () async {
                        if (formkeylogin.currentState!.validate()) {
                          try {
                            await auth.signInWithEmailAndPassword(
                                email: emaillogin, password: passwordlogin);
                            emailController.text = '';
                            passwordController.text = '';
                            navigatePushReplacementTo(context, homeLayout());
                          } catch (error) {
                            print(error);
                          }
                        }
                      },
                      color: allColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      _showAlertDialogSignup(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showAlertDialogSignup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign up"),
          content: Text("Sign up has been Successfully"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
