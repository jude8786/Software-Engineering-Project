class Budget {
  double initialAmount;
  double remainingAmount;

  Budget({
    required this.initialAmount,
    required this.remainingAmount,
  });

  void setNewBudget(double newAmount) {
    initialAmount = newAmount;
    remainingAmount = newAmount;
  }
}
