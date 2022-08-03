class BricksLogger {
  static final BricksLogger _instance = BricksLogger._internal();

  factory BricksLogger() => _instance;

  CallProxy callProxy = CallProxy();

  BricksLogger._internal();

  void debug(Object object) {
    callProxy.debug(object);
  }

  void info(Object object) {
    callProxy.info(object);
  }

  void warning(Object object) {
    callProxy.warning(object);
  }

  void error(Object object) {
    callProxy.error(object);
  }
}

class CallProxy {
  /// Call on debug messages
  void debug(Object object) => {};

  /// Call on info messages
  void info(Object object) => {};

  /// Call on warning messages
  void warning(Object object) => {};

  /// Call on error messages
  void error(Object object) => {};
}
