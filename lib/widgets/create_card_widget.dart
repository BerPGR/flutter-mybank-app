import 'package:flutter/material.dart';

class CreateCardWidget extends StatefulWidget {
  const CreateCardWidget({super.key});

  @override
  State<CreateCardWidget> createState() => _CreateCardWidgetState();
}

class _CreateCardWidgetState extends State<CreateCardWidget> {
  Color _cardColor = Color(0xFF303030);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _cardColor,
              ),
              height: 200,
            ),
          ],
        ),
        SizedBox(height: 80),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Add Card',
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                elevation: 2,
                fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                padding: EdgeInsets.all(10)),
          ),
        )
      ],
    );
  }
}
