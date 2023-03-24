abstract class Payment {
  void pay();
}

class PaymentBankSlip extends Payment {
  @override
  void pay() {
    print('Paying with bank slip ...');
  }
}

class PaymentCard extends Payment {
  @override
  void pay() {
    print('Paying with cart ...');
  }
}

class PaymentPix extends Payment {
  @override
  void pay() {
    print('Paying with pix ...');
  }
}

void main() {
  Payment payment = PaymentBankSlip();
  payment.pay();

  payment = PaymentCard();
  payment.pay();

  payment = PaymentPix();
  payment.pay();
}
