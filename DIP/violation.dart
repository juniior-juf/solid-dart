class Payment {
  void pay() {
    print('Paying ...');
  }
}

class PaymentController {
  void makePayment() {
    final payment = Payment();
    payment.pay();
  }
}

void main() {
  final controller = PaymentController();
  controller.makePayment();
}
