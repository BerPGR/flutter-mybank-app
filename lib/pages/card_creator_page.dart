import 'package:flutter/material.dart';
import 'package:mybank/model/card.dart';

class CardCreatorPage extends StatefulWidget {
  const CardCreatorPage({super.key});

  @override
  State<CardCreatorPage> createState() => _CardCreatorPageState();
}

class _CardCreatorPageState extends State<CardCreatorPage> {
  TextEditingController _numberController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  void _verificaValores() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'Add your card info',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: _numberController,
                decoration: InputDecoration(labelText: 'Number'),
              ),
              TextField(
                controller: _monthController,
                decoration: InputDecoration(labelText: 'Month'),
              ),
              TextField(
                controller: _yearController,
                decoration: InputDecoration(labelText: 'Year'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
