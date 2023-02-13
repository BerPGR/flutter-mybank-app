// ignore_for_file: public_member_api_docs, sort_constructors_first
class Card {
  final String type;
  final int cardNumber;
  final String flag;
  final double balance;
  final int expiryMonth;
  final int expiryYear;

  Card(
      {required this.type,
      required this.cardNumber,
      required this.flag,
      this.balance = 0.0,
      required this.expiryMonth,
      required this.expiryYear,
      final color});
}

List<Card> cards = [];
