// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  internal enum User {
    /// Prénom : %@
    internal static func firstName(_ p1: Any) -> String {
      return Strings.tr("Localizable", "user.firstName", String(describing: p1), fallback: "Prénom : %@")
    }
    /// Nom : %@
    internal static func lastName(_ p1: Any) -> String {
      return Strings.tr("Localizable", "user.lastName", String(describing: p1), fallback: "Nom : %@")
    }
    /// Adresse : 
    internal static let location = Strings.tr("Localizable", "user.location", fallback: "Adresse : ")
    /// Titre : %@
    internal static func title(_ p1: Any) -> String {
      return Strings.tr("Localizable", "user.title", String(describing: p1), fallback: "Titre : %@")
    }
  }
  internal enum Users {
    /// Recharger
    internal static let pullToRefresh = Strings.tr("Localizable", "users.pullToRefresh", fallback: "Recharger")
    /// Localizable.strings
    ///   Liste
    /// 
    ///   Created by Thomas on 05/01/2023.
    internal static let title = Strings.tr("Localizable", "users.title", fallback: "Liste des utilisateurs")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
