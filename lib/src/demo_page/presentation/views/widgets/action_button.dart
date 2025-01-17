import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ActionButton extends StatelessWidget {
  final String buttonName;
  final Function()? onTap;
  const ActionButton({super.key, required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 7),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), border: Border.all(color: Colors.grey.withOpacity(0.5), width: 2)),
        child: Text(buttonName,style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
