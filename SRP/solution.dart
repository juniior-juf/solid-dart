class Payment {
  void pay() {
    print('Paying ...');
    Email().sendReceiptByEmail();
  }
}

class Email {
  void sendReceiptByEmail() {
    print('Sending receipt ...');
  }
}

void main() {
  Payment payment = Payment();
  payment.pay();
}
