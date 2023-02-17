import 'package:flutter/material.dart';
import 'package:mybank/model/bank_card.dart';
import 'package:mybank/pages/card_creator_page.dart';
import 'package:mybank/widgets/buttons_widget.dart';
import 'package:mybank/widgets/my_cards.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  List allCards = [];

/* 
Widget to optimize code and show all the bank cards 
*/
  Widget _allCards() {
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            children: allCards
                .map(
                  (card) => MyCards(
                      id: card.id,
                      flag: card.flag,
                      expiryYear: card.expiryYear,
                      expiryMonth: card.expiryMonth,
                      cardNumber: card.cardNumber,
                      color: card.color,
                      balance: card.balance),
                )
                .toList(),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: allCards.length,
          effect: ExpandingDotsEffect(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /* 
    Scaffold for our layout
    */
    return Scaffold(
      body: Container(
        /* 
        Using SafeArea instead a AppBar
        */
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    /* 
                    Row at the top as the AppBar
                    */
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My personal bank',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        /*
                            Right here there's a container to a button that
                            navigate us to the Create Card Page. After that
                            we update the allCards list and show the cards below
                        */
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(25)),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) => CardCreatorPage()))
                                  .then((value) {
                                setState(() {
                                  allCards = cards;
                                });
                              });
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

                  /* 
                  Verification to check if allCards list is not empty.
                  */
                  if (allCards.isNotEmpty) _allCards(),

                  /*
                  If allCards is empty, it'll show us a message.
                  */
                  if (allCards.isEmpty)
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      child: Text("There's no cards in your account."),
                    ),
                  SizedBox(
                    height: 35,
                  ),

                  /* 
                    Row with Send, Receive and Bills buttons.
                  */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Send Button
                      ButtonWidget(
                          buttonImgPath: 'assets/images/send.png',
                          buttonText: 'Send'),

                      //Receive Button
                      ButtonWidget(
                          buttonImgPath: 'assets/images/receive.png',
                          buttonText: 'Receive'),

                      //Bills
                      ButtonWidget(
                          buttonImgPath: 'assets/images/bill.png',
                          buttonText: 'Bills'),
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
