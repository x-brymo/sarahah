import 'package:flutter/material.dart';
import 'package:sarahah/core/config/handdler_sizeBox.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      60.asSizeBoxHeight,
      Container(
        height: 70,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.red),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Caution! You will no longer be able access this account again.',
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
      25.asSizeBoxHeight,
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Are you sure you want \n to delete your account?',
            style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
          ),
           30.asSizeBoxWidth,
          TextButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 40),
              shape: const StadiumBorder(),
              backgroundColor: Colors.red,
            ),
            child: Row(children: [
              const Text('Delete',
                  style: TextStyle(fontSize: 12.0, color: Colors.white)),
                 
              const Icon(Icons.delete, color: Colors.white),
            ]),
          )
        ],
      )
    ]));
  }
}
