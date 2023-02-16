import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String buttonImgPath;
  final String buttonText;

  const ButtonWidget({
    Key? key,
    required this.buttonImgPath,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(spreadRadius: 0.03, blurRadius: 20)],
              color: Colors.pink,
              borderRadius: BorderRadius.circular(45)),
          height: 90,
          child: Center(
            child: Image.asset(buttonImgPath),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          buttonText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        )
      ],
    );
  }
}
