@JS()
library stripe;

import 'package:flutter/cupertino.dart';
import 'package:js/js.dart';

@JS()
class Stripe {
  external Stripe(String key);

  external redirectToCheckout(CheckoutOptions checkoutOptions);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external String get sessionId;

  external factory CheckoutOptions({
    @required List<LineItem> lineItems,
    @required String mode,
    @required String successUrl,
    @required String cancelUrl,
    String sessionId,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}

class StripeWeb {
  static void redirectToCheckout({
    @required final String stripeKey,
    @required final CheckoutOptions checkoutOptions,
  }) {
    Stripe(stripeKey).redirectToCheckout(checkoutOptions);
  }
}
