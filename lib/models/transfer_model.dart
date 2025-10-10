enum PaymentMethod { cash, bank1, bank2, fd }

class Transfer {
  final int id;
  final double amount;
  final PaymentMethod paymentMethodFrom;
  final PaymentMethod paymentMethodTo;
  final DateTime date;
  final DateTime time;
  final String description;

  Transfer({
    required this.id,
    required this.amount,
    required this.paymentMethodFrom,
    required this.paymentMethodTo,
    required this.date,
    required this.time,
    required this.description,
  });

  // Convert the trnsfer object to  a JSON object

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'amount': amount,
      'paymethodfrom': paymentMethodFrom.index,
      'paymethodto': paymentMethodTo.index,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  // Create an transfer object from  a JSON object
  factory Transfer.fromJSON(Map<String, dynamic> json) {
    return Transfer(
      id: json['id'],
      amount: json['amount'],
      paymentMethodFrom: PaymentMethod.values[json['paymethodfrom']],
      paymentMethodTo: PaymentMethod.values[json['paymethodto']],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
