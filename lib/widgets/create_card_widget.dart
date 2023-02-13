// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CreateCardWidget extends StatefulWidget {
  final cardColor;
  final String banco;
  final int expiryMonth;
  final int expiryYear;
  final int cardNumber;

  const CreateCardWidget({
    Key? key,
    required this.cardColor,
    required this.banco,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cardNumber,
  }) : super(key: key);

  @override
  State<CreateCardWidget> createState() => _CreateCardWidgetState();
}

class _CreateCardWidgetState extends State<CreateCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: widget.cardColor,
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [Text('${widget.cardNumber}')]),
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
