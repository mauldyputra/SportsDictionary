//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 7 images.
  struct image {
    /// Image `Mauldy Putra Pratama`.
    static let mauldyPutraPratama = Rswift.ImageResource(bundle: R.hostingBundle, name: "Mauldy Putra Pratama")
    /// Image `birthday`.
    static let birthday = Rswift.ImageResource(bundle: R.hostingBundle, name: "birthday")
    /// Image `computer`.
    static let computer = Rswift.ImageResource(bundle: R.hostingBundle, name: "computer")
    /// Image `email`.
    static let email = Rswift.ImageResource(bundle: R.hostingBundle, name: "email")
    /// Image `phone`.
    static let phone = Rswift.ImageResource(bundle: R.hostingBundle, name: "phone")
    /// Image `profile`.
    static let profile = Rswift.ImageResource(bundle: R.hostingBundle, name: "profile")
    /// Image `sports`.
    static let sports = Rswift.ImageResource(bundle: R.hostingBundle, name: "sports")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "Mauldy Putra Pratama", bundle: ..., traitCollection: ...)`
    static func mauldyPutraPratama(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.mauldyPutraPratama, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "birthday", bundle: ..., traitCollection: ...)`
    static func birthday(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.birthday, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "computer", bundle: ..., traitCollection: ...)`
    static func computer(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.computer, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "email", bundle: ..., traitCollection: ...)`
    static func email(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.email, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "phone", bundle: ..., traitCollection: ...)`
    static func phone(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.phone, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "profile", bundle: ..., traitCollection: ...)`
    static func profile(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.profile, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "sports", bundle: ..., traitCollection: ...)`
    static func sports(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.sports, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Main"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 9 nibs.
  struct nib {
    /// Nib `HomeCell`.
    static let homeCell = _R.nib._HomeCell()
    /// Nib `HomeViewController`.
    static let homeViewController = _R.nib._HomeViewController()
    /// Nib `HomeViewControllers`.
    static let homeViewControllers = _R.nib._HomeViewControllers()
    /// Nib `NoConnectionViewController`.
    static let noConnectionViewController = _R.nib._NoConnectionViewController()
    /// Nib `ProfileCellMenu`.
    static let profileCellMenu = _R.nib._ProfileCellMenu()
    /// Nib `ProfileHeaderCell`.
    static let profileHeaderCell = _R.nib._ProfileHeaderCell()
    /// Nib `SportsDetailVC`.
    static let sportsDetailVC = _R.nib._SportsDetailVC()
    /// Nib `WalkthroughCell`.
    static let walkthroughCell = _R.nib._WalkthroughCell()
    /// Nib `WalkthroughView`.
    static let walkthroughView = _R.nib._WalkthroughView()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "HomeCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.homeCell) instead")
    static func homeCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.homeCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "HomeViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.homeViewController) instead")
    static func homeViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.homeViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "HomeViewControllers", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.homeViewControllers) instead")
    static func homeViewControllers(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.homeViewControllers)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "NoConnectionViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.noConnectionViewController) instead")
    static func noConnectionViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.noConnectionViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ProfileCellMenu", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.profileCellMenu) instead")
    static func profileCellMenu(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.profileCellMenu)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "ProfileHeaderCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.profileHeaderCell) instead")
    static func profileHeaderCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.profileHeaderCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "SportsDetailVC", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.sportsDetailVC) instead")
    static func sportsDetailVC(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.sportsDetailVC)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "WalkthroughCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.walkthroughCell) instead")
    static func walkthroughCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.walkthroughCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "WalkthroughView", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.walkthroughView) instead")
    static func walkthroughView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.walkthroughView)
    }
    #endif

    static func homeCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> HomeCell? {
      return R.nib.homeCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HomeCell
    }

    static func homeViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.homeViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func homeViewControllers(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.homeViewControllers.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func noConnectionViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.noConnectionViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func profileCellMenu(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileCellMenu? {
      return R.nib.profileCellMenu.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileCellMenu
    }

    static func profileHeaderCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileHeaderCell? {
      return R.nib.profileHeaderCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileHeaderCell
    }

    static func sportsDetailVC(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.sportsDetailVC.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    static func walkthroughCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> WalkthroughCell? {
      return R.nib.walkthroughCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? WalkthroughCell
    }

    static func walkthroughView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
      return R.nib.walkthroughView.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `HomeCellIdentifier`.
    static let homeCellIdentifier: Rswift.ReuseIdentifier<HomeCell> = Rswift.ReuseIdentifier(identifier: "HomeCellIdentifier")
    /// Reuse identifier `WalkthroughCellIdentifier`.
    static let walkthroughCellIdentifier: Rswift.ReuseIdentifier<WalkthroughCell> = Rswift.ReuseIdentifier(identifier: "WalkthroughCellIdentifier")
    /// Reuse identifier `profileCellHeaderIdentifier`.
    static let profileCellHeaderIdentifier: Rswift.ReuseIdentifier<ProfileHeaderCell> = Rswift.ReuseIdentifier(identifier: "profileCellHeaderIdentifier")
    /// Reuse identifier `profileCellMenuIdentifier`.
    static let profileCellMenuIdentifier: Rswift.ReuseIdentifier<ProfileCellMenu> = Rswift.ReuseIdentifier(identifier: "profileCellMenuIdentifier")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _ProfileHeaderCell.validate()
    }

    struct _HomeCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = HomeCell

      let bundle = R.hostingBundle
      let identifier = "HomeCellIdentifier"
      let name = "HomeCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> HomeCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HomeCell
      }

      fileprivate init() {}
    }

    struct _HomeViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "HomeViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _HomeViewControllers: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "HomeViewControllers"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _NoConnectionViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "NoConnectionViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _ProfileCellMenu: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = ProfileCellMenu

      let bundle = R.hostingBundle
      let identifier = "profileCellMenuIdentifier"
      let name = "ProfileCellMenu"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileCellMenu? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileCellMenu
      }

      fileprivate init() {}
    }

    struct _ProfileHeaderCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = ProfileHeaderCell

      let bundle = R.hostingBundle
      let identifier = "profileCellHeaderIdentifier"
      let name = "ProfileHeaderCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> ProfileHeaderCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? ProfileHeaderCell
      }

      static func validate() throws {
        if UIKit.UIImage(named: "Mauldy Putra Pratama", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'Mauldy Putra Pratama' is used in nib 'ProfileHeaderCell', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    struct _SportsDetailVC: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "SportsDetailVC"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    struct _WalkthroughCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = WalkthroughCell

      let bundle = R.hostingBundle
      let identifier = "WalkthroughCellIdentifier"
      let name = "WalkthroughCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> WalkthroughCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? WalkthroughCell
      }

      fileprivate init() {}
    }

    struct _WalkthroughView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "WalkthroughView"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = MainViewController

      let bundle = R.hostingBundle
      let name = "Main"

      static func validate() throws {
        if UIKit.UIImage(named: "profile", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'profile' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "sports", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'sports' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
