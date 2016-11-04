@TestOn('browser')
import 'dart:async';

import 'package:test/test.dart';
import 'package:w_transport/browser.dart';
import 'package:w_transport/w_transport.dart' as transport;

void main() {
  test('w_transport Future not resolved repro', () async {
    transport.globalTransportPlatform = browserTransportPlatform;

    var request = new transport.Request()
      ..uri = Uri.parse('http://httpstat.us/200');
    var responseFuture = request.get();
    await new Future.delayed(new Duration(milliseconds: 5));
    request.abort();
    expect(responseFuture, throws);
  });
}
