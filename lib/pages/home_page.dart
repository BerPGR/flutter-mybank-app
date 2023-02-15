import 'package:flutter/material.dart';
import 'package:mybank/model/bank_card.dart';
import 'package:mybank/pages/card_creator_page.dart';
import 'package:mybank/widgets/my_cards.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My personal bank',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(25)),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CardCreatorPage()));
                            },
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  if (cards.isEmpty)
                    Container(
                      height: 200,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('There are no cards in your account'),
                      ),
                    ),
                  if (cards.isNotEmpty)
                    Column(
                      children: [
                        Container(
                          height: 200,
                          child: PageView(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            children: [
                              for (final card in cards)
                                MyCards(
                                    flag: card.flag,
                                    expiryYear: card.expiryYear,
                                    expiryMonth: card.expiryMonth,
                                    cardNumber: card.cardNumber,
                                    color: card.color,
                                    balance: card.balance),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: cards.length,
                          effect: ExpandingDotsEffect(),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
