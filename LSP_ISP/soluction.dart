abstract class Payment {
  void pay();
}

abstract class Flag {
  void selectFlag();
}

class PaymentCard implements Payment, Flag {
  @override
  void selectFlag() {
    print('Selecting card flag ...');
  }

  @override
  void pay() {
    print('Paying with card ...');
  }
}

class PaymentBankSlip implements Payment {
  @override
  void pay() {
    print('Paying with bank slip ...');
  }
}

void main() {
  final paymentCard = PaymentCard();
  paymentCard.selectFlag();
  paymentCard.pay();

  final paymentBankSlip = PaymentBankSlip();
  paymentBankSlip.pay();
}
