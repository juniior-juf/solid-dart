class Payment {
  void pay() {
    print('Paying ...');
    sendReceiptByEmail();
  }

  void sendReceiptByEmail() {
    print('Sending receipt ...');
  }
}

void main() {
  Payment payment = Payment();
  payment.pay();
}
