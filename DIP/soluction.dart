abstract class Payment {
  void pay();
}

class PaymentCard implements Payment {
  void pay() {
    print('Paying with card ...');
  }
}

class PaymentPix implements Payment {
  void pay() {
    print('Paying with pix ...');
  }
}

class PaymentController {
  void makePayment(Payment payment) {
    payment.pay();
  }
}

void main() {
  final controller = PaymentController();

  final paymentCard = PaymentCard();
  controller.makePayment(paymentCard);

  final paymentPix = PaymentPix();
  controller.makePayment(paymentPix);
}
