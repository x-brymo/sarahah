import 'package:flutter/material.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
     bool _obx = false;
     bool _obx2 = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final cPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, children: [
        0.asSizeBoxHeight,
        Container(
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          child: Form(child: Column(
            children: [
              25.asSizeBoxHeight,
               ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        obscureText: !_obx2,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Current Password',
                          filled: true,
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                passwordVisibility2();
                              },
                              icon: Icon(
                                _obx ? Icons.visibility : Icons.visibility_off,
                              )),
                        ),
                        controller: currentPassword,
                      ),
                    ),
                    25.asSizeBoxHeight,
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        obscureText: !_obx,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText:  ' New Password',
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
                        controller: newPassword,
                      ),
                    ),
                     25.asSizeBoxHeight,
                     ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        obscureText: !_obx,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText:  ' Confirm Password',
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
                        controller: cPassword,
                      ),
                    ),

            ],
          )),
        ),
        25.asSizeBoxHeight,
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(300, 50),
          ),
          onPressed: () {},
          child: const Text('Change Password'),
        ),
        ])
    );
  }

  void passwordVisibility() {
    setState(() {
      _obx = !_obx;
    });}
  void passwordVisibility2() {
    setState(() {
      _obx2 = !_obx2;
    });
  }}
