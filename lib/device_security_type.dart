/// Enumeration of possible device security types.
enum DeviceSecurityType {
  /// PIN security.
  pin,
  /// Pattern security.
  pattern,
  /// Passcode security.
  passcode,
  /// Face scan.
  face,
  /// Fingerprint scan.
  touch,
  /// Unknown biometric security.
  biometric,
  /// Device security is not enrolled.
  none,
  /// Platform does not support detecting security type.
  unsupported,
}
