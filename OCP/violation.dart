class Payment {
  void pay(String type) {
    switch (type) {
      case 'bankSlip':
        print('Paying with bank slip ...');
        break;
      case 'card':
        print('Paying with cart ...');
        break;
      default:
        print('None form of payment');
    }
  }
}

void main() {
  Payment payment = Payment();
  payment.pay('bankSlip');
  payment.pay('card');
}
