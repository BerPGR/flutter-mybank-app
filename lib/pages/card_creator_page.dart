import 'package:flutter/material.dart';
import 'package:mybank/model/bank_card.dart';
import 'package:mybank/widgets/create_card_widget.dart';

class CardCreatorPage extends StatefulWidget {
  const CardCreatorPage({super.key});

  @override
  State<CardCreatorPage> createState() => _CardCreatorPageState();
}

class _CardCreatorPageState extends State<CardCreatorPage> {
  String flagImagePath = '';
  String _banco = '';
  Color cardColor = Color(0xFF0303030);

  TextEditingController _numberController = TextEditingController();
  TextEditingController _monthController = TextEditingController();
  TextEditingController _yearController = TextEditingController();

  List<String> _bancos = [
    'Caixa',
    'Bradesco',
    'Itaú',
    'Banco do Brasil',
    'NuBank',
    'Inter'
  ];

  Color setCardColor(String banco) {
    Color color;
    if (banco == 'Bradesco') {
      color = Color(0xFFC40027);
    } else if (banco == 'Itaú') {
      color = Color(0xFF003091);
    } else if (banco == 'Banco do Brasil') {
      color = Color(0xFFECD219);
    } else if (banco == 'Caixa') {
      color = Color(0xFF175997);
    } else if (banco == 'NuBank') {
      color = Color(0xFF9600D0);
    } else if (banco == 'Inter') {
      color = Color(0xFFF27400);
    } else {
      color = Color(0xFF303030);
    }

    return color;
  }

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
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: Navigator.of(context).pop,
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Text(
                        'Add your card info',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                DropdownButton<String>(
                  elevation: 8,
                  hint: Text('Choose your bank!'),
                  value: _banco.isNotEmpty ? _banco : null,
                  onChanged: (value) {
                    setState(() {
                      _banco = value.toString();
                      cardColor = setCardColor(_banco);
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
                  onChanged: (value) {
                    if (value.length == 16) {
                      if (value.substring(0, 1) == '4') {
                        setState(() {
                          flagImagePath = 'assets/images/visa.png';
                        });
                      } else if (int.parse(value.substring(0, 2)) > 50 &&
                          int.parse(value.substring(0, 2)) < 56) {
                        setState(() {
                          flagImagePath = 'assets/images/mastercard.png';
                        });
                      }
                    }
                  },
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
                CreateCardWidget(
                  flagImagePath: flagImagePath,
                  cardColor: cardColor,
                  banco: _banco,
                  cardNumber: _numberController.text.isNotEmpty
                      ? _numberController.text
                      : '',
                  expiryMonth: _monthController.text.isNotEmpty
                      ? int.parse(_monthController.text)
                      : 0,
                  expiryYear: _yearController.text.isNotEmpty
                      ? int.parse(_yearController.text)
                      : 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
