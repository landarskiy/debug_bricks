/// Logger class which used in different debug bricks packages.
///
/// This class just redirect calls to [CallProxy] instance.
/// There aren't any print to console.
class BricksLogger {
  static final BricksLogger _instance = BricksLogger._internal();

  factory BricksLogger() => _instance;

  /// Logger proxy.
  ///
  /// Override this value on your application level code if you would like to
  /// handle log messages from beg bricks packages.
  CallProxy callProxy = CallProxy();

  BricksLogger._internal();

  /// Call on debug messages
  void debug(Object object) {
    callProxy.debug(object);
  }

  /// Call on info messages
  void info(Object object) {
    callProxy.info(object);
  }

  /// Call on warning messages
  void warning(Object object) {
    callProxy.warning(object);
  }

  /// Call on error messages
  void error(Object object) {
    callProxy.error(object);
  }
}

/// Proxy logger class.
///
/// See details [BricksLogger.callProxy]
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
