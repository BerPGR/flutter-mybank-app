import 'package:flutter/material.dart';
import 'package:mybank/model/card.dart';
import 'package:mybank/widgets/create_card_widget.dart';

class CardCreatorPage extends StatefulWidget {
  const CardCreatorPage({super.key});

  @override
  State<CardCreatorPage> createState() => _CardCreatorPageState();
}

class _CardCreatorPageState extends State<CardCreatorPage> {
  List<String> _bancos = [
    'Caixa',
    'Bradesco',
    'Itaú',
    'Banco do Brasil',
    'NuBank',
    'Inter'
  ];
  String _banco = '';

  TextEditingController _numberController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Add your card info',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
                DropdownButton<String>(
                  elevation: 8,
                  hint: Text('Choose your bank!'),
                  value: _banco.isNotEmpty ? _banco : null,
                  onChanged: (value) {
                    setState(() {
                      _banco = value.toString();
                    });
                  },
                  items: _bancos.map(
                    (String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  maxLength: 16,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.4),
                      child: TextField(
                        controller: _monthController,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration(
                          labelText: 'Month',
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.4),
                      child: TextField(
                        controller: _yearController,
                        keyboardType: TextInputType.number,
                        maxLength: 2,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          labelStyle: TextStyle(color: Colors.deepPurple),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              color: Colors.deepPurple,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                CreateCardWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
