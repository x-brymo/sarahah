import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';
import 'package:sarahah/core/widgets/btn_auth.dart';
import 'package:sarahah/models/user_model.dart';

import '../login.dart';


class RegisterScreenPage extends StatefulWidget {
  const RegisterScreenPage({super.key});

  @override
  State<RegisterScreenPage> createState() => _RegisterScreenPageState();
}

class _RegisterScreenPageState extends State<RegisterScreenPage> {
   bool _obx = false;
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   final email = TextEditingController();
   final password = TextEditingController();
   final cPassword = TextEditingController();
   final name = TextEditingController();
   final phoneNumber = TextEditingController();
   final address = TextEditingController();
   


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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }else if(value.contains('@') == false){
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            controller: email,
                          ),
                          25.asSizeBoxHeight,
                          TextFormField(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Full Name',
                              filled: true,
                              fillColor: Colors.white,
                             
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            controller: name,
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
                              (
                                onPressed: (){
                                passwordVisibility();
                              }, icon: Icon(_obx ? Icons.visibility : Icons.visibility_off,)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;  
                              },
                              controller: password,
                          ),
                          20.asSizeBoxHeight,
                          TextFormField(
                            obscureText: !_obx,
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Confirm Password',
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton
                              (
                                onPressed: (){
                                passwordVisibility();
                              }, icon: Icon(_obx ? Icons.visibility : Icons.visibility_off,)),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }else if(password.text != cPassword.text){
                                return 'Password does not match';
                              }
                              return null;
                              
                            },
                            controller: cPassword,
                          ),
                          20.asSizeBoxHeight,
                          TextFormField(
                           
                            keyboardType: TextInputType.number,
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Phone Number',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone number';
                              }
                              return null;
                            },
                            controller: phoneNumber,
                          ),
                          20.asSizeBoxHeight,
                          TextFormField(
                           
                            decoration:  InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Address',
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon:  Icon( Icons.location_on) ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your address';
                              }
                              return null;
                            },
 controller:  address, 
                              ),
                            
                          
                          20.asSizeBoxHeight,
                          CustomButtonsAuth(
                      nameSign: "Login",
                      color: Colors.blue,
                      icon: Icons.login,
                      colorIcon: Colors.white,
                      sizeIcon: 20,
                      tap: () {
                          register(email.text, password.text, name.text, phoneNumber.text, address.text);
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
  void register(
    String email, String password,  String name, String phoneNumber, String address

  )async{
    if(_formKey.currentState!.validate()){
      final client =  Dio();
      try {
        final response = await  client.post('https://reqres.in/api/register', data: {
          "email": email,
          "password": password,
          "name": name,
          "phone": phoneNumber,
          "address": address
        });
        print(response.data);
        final  mydata = response.data;
        print(mydata['token']);
        final user = UserModel.fromJson(mydata);
        print(user.name);
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } catch (e) {
        print("Server Error :$e");
      }
    }
  }
}