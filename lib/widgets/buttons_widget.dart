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
              color: Colors.grey[300], borderRadius: BorderRadius.circular(45)),
          height: 80,
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
