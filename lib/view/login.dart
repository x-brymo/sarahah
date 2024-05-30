import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';
import 'package:sarahah/core/widgets/btn_auth.dart';
import 'package:sarahah/view/home/home_page.dart';
import 'package:sarahah/view/register_screen/register_screen_page.dart';

import '../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obx = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {},
          child: Column(
            children: [
              50.asSizeBoxHeight,
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Lottie.asset(
                  'asset/lottie/login.json',
                  fit: BoxFit.fill,
                  reverse: true,
                  repeat: true,
                  animate: true,
                ),
              ),
              25.asSizeBoxHeight,
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                          filled: true,
                          //fillColor: Colors.white,
                        ),
                        controller: email,
                      ),
                    ),
                    25.asSizeBoxHeight,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        obscureText: !_obx,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                passwordVisibility();
                              },
                              icon: Icon(
                                _obx ? Icons.visibility : Icons.visibility_off,
                              )),
                        ),
                        controller: password,
                      ),
                    ),
                    10.asSizeBoxHeight,
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {

                 // login();
                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => const HomePage(),
                   ),
                 );
                },
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(350, 50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    10.asSizeBoxWidth,
                    const Icon(BootstrapIcons.arrow_right)
                  ],
                ),
              ),
              10.asSizeBoxHeight,
              CustomButtonsAuth(
                  nameSign: "Google",
                  color: Colors.black45,
                  icon: BootstrapIcons.google,
                  colorIcon: Colors.white,
                  sizeIcon: 20,
                  tap: () {}),
              CustomButtonsAuth(
                  nameSign: "Github",
                  color: Colors.black45,
                  icon: BootstrapIcons.github,
                  colorIcon: Colors.white,
                  sizeIcon: 20,
                  tap: () {}),
              20.asSizeBoxHeight,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterScreenPage()));
                },
                child: const Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              20.asSizeBoxHeight,
              Text(
                "Terms and Conditions  and Privacy Policy \n                           of Sarahah",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void passwordVisibility() {
    setState(() {
      _obx = !_obx;
    });
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      final client = Dio();
      try {
        final response = await client.post('https://reqres.in/api/login',
            data: {"email": email.text, "password": password.text});
        print(response.data);
        final mydata = response.data;
        print(mydata['token']);
        final user = UserModel.fromJson(mydata);
        print(user.name);
      } catch (e) {
        print("Server Error :$e");
      }
    }
  }
}
