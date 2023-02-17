// ignore_for_file: public_member_api_docs, sort_constructors_first
class BankCard {
  final String cardNumber;
  final String flag;
  final double balance;
  final int expiryMonth;
  final int expiryYear;
  final color;
  final int id;

  BankCard(
      {required this.id,
      required this.cardNumber,
      required this.flag,
      this.balance = 0.0,
      required this.expiryMonth,
      required this.expiryYear,
      required this.color});
}

List<BankCard> cards = [];
