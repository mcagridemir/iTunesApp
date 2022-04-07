// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizationKeys {
  /// Error
  internal static var error: String { return LocalizationKeys.tr("Localizable", "error") }
  /// 4
  internal static var four: String { return LocalizationKeys.tr("Localizable", "four") }
  /// 1
  internal static var one: String { return LocalizationKeys.tr("Localizable", "one") }
  /// %@ adet sonuc bulundu.
  internal static func resultFound(_ p1: Any) -> String {
    return LocalizationKeys.tr("Localizable", "result_found", String(describing: p1))
  }
  /// Successful
  internal static var successful: String { return LocalizationKeys.tr("Localizable", "successful") }
  /// 3
  internal static var three: String { return LocalizationKeys.tr("Localizable", "three") }
  /// 2
  internal static var two: String { return LocalizationKeys.tr("Localizable", "two") }
  /// Warning
  internal static var warning: String { return LocalizationKeys.tr("Localizable", "Warning") }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension LocalizationKeys {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = translate(key, table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}
