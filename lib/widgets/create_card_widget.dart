// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mybank/model/bank_card.dart';

class CreateCardWidget extends StatefulWidget {
  final cardColor;
  final String banco;
  final int expiryMonth;
  final int expiryYear;
  final String cardNumber;
  final String flagImagePath;

  const CreateCardWidget(
      {Key? key,
      required this.banco,
      required this.expiryMonth,
      required this.expiryYear,
      required this.cardNumber,
      required this.flagImagePath,
      required this.cardColor})
      : super(key: key);

  @override
  State<CreateCardWidget> createState() => _CreateCardWidgetState();
}

class _CreateCardWidgetState extends State<CreateCardWidget> {
  double saldo = 0;
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$${saldo.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      if (widget.flagImagePath.isNotEmpty)
                        Image.asset(
                          widget.flagImagePath,
                          height: 50,
                          fit: BoxFit.contain,
                        )
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  if (widget.cardNumber.length == 16)
                    Text(
                      '${widget.cardNumber.substring(0, 4)} ' +
                          '${widget.cardNumber.substring(4, 8)} ' +
                          '${widget.cardNumber.substring(8, 12)} ' +
                          '${widget.cardNumber.substring(12, 16)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  if (widget.expiryMonth > 0 && widget.expiryYear > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '${widget.expiryMonth}/' + '${widget.expiryYear}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              cards.add(BankCard(
                  color: widget.cardColor,
                  cardNumber: widget.cardNumber,
                  flag: widget.flagImagePath,
                  expiryMonth: widget.expiryMonth,
                  expiryYear: widget.expiryYear));
              Navigator.of(context).pop();
            },
            child: Text(
              'Add Card',
              style: TextStyle(fontSize: 29),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: widget.cardColor,
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
