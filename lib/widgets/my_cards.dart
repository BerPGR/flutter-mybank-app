// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mybank/model/bank_card.dart';
import 'package:mybank/pages/home_page.dart';

class MyCards extends StatefulWidget {
  final int id;
  final String cardNumber;
  final int expiryMonth;
  final int expiryYear;
  final String flag;
  final double balance;
  final color;

  const MyCards(
      {Key? key,
      required this.id,
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
  TextEditingController _balanceController = TextEditingController();

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
                Row(
                  children: [
                    Text(
                      'R\$${widget.balance.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    /*
                    Button to add balance to actual card 
                    */
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext builder) => AlertDialog(
                                  title: Text('Select an amount'),
                                  content: TextField(
                                    controller: _balanceController,
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context, 'Add amount');
                                        },
                                        child: Text('Add amount'))
                                  ],
                                ));
                      },
                    ),
                    /* 
                    Icon to
                    delete the actual card
                    */
                    IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext builder) => AlertDialog(
                                    title: Text('Are you sure?'),
                                    content: Text(
                                        "You are going to delete this card!"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'Yes');
                                          },
                                          child: Text('Yes')),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context, 'NO');
                                          },
                                          child: Text('NO'))
                                    ],
                                  ));
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ],
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
