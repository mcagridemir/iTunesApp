// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Assets {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal enum Icons {
      internal static let arrow = ImageAsset(name: "arrow")
      internal static let backArrow = ImageAsset(name: "back-arrow")
      internal static let checkmark = ImageAsset(name: "checkmark")
      internal static let error = ImageAsset(name: "error")
      internal static let goBack = ImageAsset(name: "go-back")
      internal static let iconCross = ImageAsset(name: "icon-cross")
      internal static let infoWarning = ImageAsset(name: "info-warning")
      internal static let smile = ImageAsset(name: "smile")
    }
    internal enum TabBar {
      internal static let accountActive = ImageAsset(name: "account-active")
      internal static let account = ImageAsset(name: "account")
      internal static let bagActive = ImageAsset(name: "bag-active")
      internal static let bag = ImageAsset(name: "bag")
      internal static let feedActive = ImageAsset(name: "feed-active")
      internal static let feed = ImageAsset(name: "feed")
      internal static let homeActive = ImageAsset(name: "home-active")
      internal static let home = ImageAsset(name: "home")
      internal static let shopActive = ImageAsset(name: "shop-active")
      internal static let shop = ImageAsset(name: "shop")
    }
    internal static let kocLogo = ImageAsset(name: "koc-logo")
  }
  internal enum Colors {
    internal enum ForegroundColors {
      internal static let _2B2D42 = ColorAsset(name: "2B2D42")
      internal static let _8D99Ae = ColorAsset(name: "8D99AE")
      internal static let warningForegroundColor = ColorAsset(name: "warning-foreground-color")
    }
    internal enum MainColors {
      internal static let _582C83 = ColorAsset(name: "582C83")
      internal static let adb5Bd = ColorAsset(name: "ADB5BD")
      internal static let e03C30 = ColorAsset(name: "E03C30")
      internal static let e6B91E = ColorAsset(name: "E6B91E")
      internal static let e9Ecef = ColorAsset(name: "E9ECEF")
      internal static let f4F4F4 = ColorAsset(name: "F4F4F4")
      internal static let darkYellowColor = ColorAsset(name: "dark-yellow-color")
      internal static let mainBlack = ColorAsset(name: "mainBlack")
      internal static let mainGray = ColorAsset(name: "mainGray")
      internal static let mainGreen = ColorAsset(name: "mainGreen")
      internal static let mainRed = ColorAsset(name: "mainRed")
      internal static let mainWhite = ColorAsset(name: "mainWhite")
    }
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
