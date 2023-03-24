abstract class Payment {
  void selectFlag();
  void pay();
}

class PaymentCard implements Payment {
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
  void selectFlag() {
    throw Exception('There are no flags to select');
  }

  @override
  void pay() {
    print('Paying with bank slip ...');
  }
}

void main() {
  Payment payment = PaymentCard();
  payment.selectFlag();
  payment.pay();

  payment = PaymentBankSlip();
  payment.selectFlag();
  payment.pay();
}
