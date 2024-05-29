import 'package:flutter/material.dart';

class CustomButtonsAuth extends StatelessWidget {
  const CustomButtonsAuth(
      {super.key,
      this.icon,
      required this.nameSign,
      this.color,
      this.style,
      this.tap, this.colorIcon, this.sizeIcon});
  final IconData? icon;
  final String nameSign;
  final Color? color;
  final Color? colorIcon;
  final double? sizeIcon;
  final TextStyle? style;
  final void Function()? tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 50,
            width: 350,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: color,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFF8F8E8E),
                    offset: Offset(.3, .2),
                    blurRadius: .010,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Center(
                  child: ListTile(
                    title: Text(
                      nameSign,
                      style: style,
                    ),
                    trailing: Icon(icon , color: colorIcon,size: sizeIcon,),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}