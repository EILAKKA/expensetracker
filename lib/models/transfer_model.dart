enum PaymentMethod { cash, bank1, bank2, fd }

class Transfer {
  final int id;
  final String title;
  final double amount;
  final PaymentMethod paymentMethodFrom;
  final PaymentMethod paymentMethodTo;
  final DateTime date;
  final DateTime time;
  final String description;

  Transfer({
    required this.id,
    required this.title,
    required this.amount,
    required this.paymentMethodFrom,
    required this.paymentMethodTo,
    required this.date,
    required this.time,
    required this.description,
  });
}
