import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';
import 'package:sarahah/core/widgets/btn_auth.dart';

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
    return  Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: () {
                  
                },
                child: Column(
                  children: [
                    50.asSizeBoxHeight,
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Lottie.asset('asset/lottie/login.json',
                       fit: BoxFit.fill, reverse: true,
                        repeat: true, animate: true,
                      ),
                    ),
                
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Email',
                              filled: true,
                              fillColor: Colors.white,
                             
                            ),
                          ),
                          25.asSizeBoxHeight,
                          TextFormField(
                            obscureText: !_obx,
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton
                              (onPressed: (){
                                passwordVisibility();
                              }, icon: Icon(_obx ? Icons.visibility : Icons.visibility_off,)),
                            ),
                          ),
                          20.asSizeBoxHeight,
                          CustomButtonsAuth(
                      nameSign: "Login",
                      color: Colors.blue,
                      icon: Icons.login,
                      colorIcon: Colors.white,
                      sizeIcon: 20,
                      tap: () {
                        login();
                        })
                        ],
                      ),
                    ),
                    const Row(
                      children: [
                        Divider(),
                        Text("Or"),
                        Divider(),
                      ]
                    ),
                    20.asSizeBoxHeight,
                    CustomButtonsAuth(
                      nameSign: "Google",
                      color: Colors.blue,
                      icon: BootstrapIcons.google,
                      colorIcon: Colors.white,
                      sizeIcon: 20,
                      tap: () {
                        
                        
                      }),
                    CustomButtonsAuth(
                      nameSign: "Github",
                      color: Colors.blue,
                      icon: BootstrapIcons.github,
                      colorIcon: Colors.white,
                      sizeIcon: 20,
                      tap: () {
                        
                        
                      }),
                  ],
                ),
              ),
            ),
          )
        );
      
    
  }
  void passwordVisibility(){
    setState(() {
      _obx = !_obx;
    });
  }
  void login()async{
    if(_formKey.currentState!.validate()){
      final client =  Dio(); 
      try {
      final response = await  client.post('https://reqres.in/api/login', data: {
        "email": email.text,
        "password": password.text
      });
      print(response.data);
      final  mydata = response.data;
      print(mydata['token']);
      final user = UserModel.fromJson(mydata);
      print(user.name);
      } catch (e) {
        print("Server Error :$e");
        
      }
    }
  }
}