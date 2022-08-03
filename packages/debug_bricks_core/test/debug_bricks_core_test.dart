import 'package:debug_bricks_core/src/bricks_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Check poxy call', () {
    final logger = BricksLogger();
    final proxy = TestCallProxy();
    logger.callProxy = proxy;
    logger.debug('d');
    expect(proxy.debugValue, 'd');
    logger.info('i');
    expect(proxy.infoValue, 'i');
    logger.warning('w');
    expect(proxy.warningValue, 'w');
    logger.error('e');
    expect(proxy.errorValue, 'e');
  });
}

class TestCallProxy extends CallProxy {
  String? debugValue;
  String? infoValue;
  String? warningValue;
  String? errorValue;

  @override
  void debug(Object object) => {debugValue = object.toString()};

  @override
  void info(Object object) => {infoValue = object.toString()};

  @override
  void warning(Object object) => {warningValue = object.toString()};

  @override
  void error(Object object) => {errorValue = object.toString()};
}
