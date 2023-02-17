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
  int cardId = cards.length;
  double saldo = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //This container ii's where the cards info will be
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
                      //Text to show current balance
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

                  // Verification to create card numbers
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
        SizedBox(height: 40),
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: () {
              if (widget.expiryMonth == 0 ||
                  widget.expiryYear == 0 ||
                  widget.cardNumber.length < 16 ||
                  widget.banco.isEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext builder) => AlertDialog(
                          title: Text('There are missing fields!'),
                          content: Text('Check the fields again'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'OK');
                                },
                                child: Text('Ok'))
                          ],
                        ));
              } else {
                if (cards.length == 0) {
                  setState(() {
                    cardId = 0;
                  });
                } else {
                  cardId = cards.length + 1;
                }
                cards.add(BankCard(
                    id: cardId,
                    color: widget.cardColor,
                    cardNumber: widget.cardNumber,
                    flag: widget.flagImagePath,
                    expiryMonth: widget.expiryMonth,
                    expiryYear: widget.expiryYear));
                Navigator.of(context).pop();
              }
            },
            child: Text(
              'Add Card',
              style: TextStyle(fontSize: 20),
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
