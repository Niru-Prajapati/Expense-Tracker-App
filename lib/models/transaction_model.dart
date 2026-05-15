class TransactionModel {
  String title;
  double amount;
  bool isIncome;
  String category;
  String date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.category,
    required this.date,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'amount': amount,
      'isIncome': isIncome,
      'category': category,
      'date': date,
    };
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      title: json['title'],
      amount: json['amount'],
      isIncome: json['isIncome'],
      category: json['category'],
      date: json['date'],
    );
  }
}