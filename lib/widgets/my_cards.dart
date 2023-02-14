// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyCards extends StatefulWidget {
  final String cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final String flag;
  final double balance;
  final color;

  const MyCards(
      {Key? key,
      required this.cardNumber,
      required this.expiryMonth,
      required this.expiryYear,
      required this.flag,
      required this.balance,
      required this.color})
      : super(key: key);

  @override
  State<MyCards> createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.color,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'R\$${widget.balance.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                if (widget.flag.isNotEmpty)
                  Image.asset(
                    widget.flag,
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
    );
  }
}
