//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 21 files.
  struct file {
    /// Resource file `DfaihBBXUAACdWy.jpg-large.jpeg`.
    static let dfaihBBXUAACdWyJpgLargeJpeg = Rswift.FileResource(bundle: R.hostingBundle, name: "DfaihBBXUAACdWy.jpg-large", pathExtension: "jpeg")
    /// Resource file `GoogleService-Info.plist`.
    static let googleServiceInfoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "GoogleService-Info", pathExtension: "plist")
    /// Resource file `GothamRounded-Bold.otf`.
    static let gothamRoundedBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-Bold", pathExtension: "otf")
    /// Resource file `GothamRounded-BoldItalic.otf`.
    static let gothamRoundedBoldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-BoldItalic", pathExtension: "otf")
    /// Resource file `GothamRounded-Book.otf`.
    static let gothamRoundedBookOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-Book", pathExtension: "otf")
    /// Resource file `GothamRounded-BookItalic.otf`.
    static let gothamRoundedBookItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-BookItalic", pathExtension: "otf")
    /// Resource file `GothamRounded-Light.otf`.
    static let gothamRoundedLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-Light", pathExtension: "otf")
    /// Resource file `GothamRounded-LightItalic.otf`.
    static let gothamRoundedLightItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-LightItalic", pathExtension: "otf")
    /// Resource file `GothamRounded-Medium.otf`.
    static let gothamRoundedMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-Medium", pathExtension: "otf")
    /// Resource file `GothamRounded-MediumItalic.otf`.
    static let gothamRoundedMediumItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRounded-MediumItalic", pathExtension: "otf")
    /// Resource file `GothamRoundedBold_21016.ttf`.
    static let gothamRoundedBold_21016Ttf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRoundedBold_21016", pathExtension: "ttf")
    /// Resource file `GothamRoundedBook_21018.ttf`.
    static let gothamRoundedBook_21018Ttf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRoundedBook_21018", pathExtension: "ttf")
    /// Resource file `GothamRoundedLight_21020.ttf`.
    static let gothamRoundedLight_21020Ttf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRoundedLight_21020", pathExtension: "ttf")
    /// Resource file `GothamRoundedMedium_21022.ttf`.
    static let gothamRoundedMedium_21022Ttf = Rswift.FileResource(bundle: R.hostingBundle, name: "GothamRoundedMedium_21022", pathExtension: "ttf")
    /// Resource file `ada-lovelace.jpg`.
    static let adaLovelaceJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "ada-lovelace", pathExtension: "jpg")
    /// Resource file `banner.png`.
    static let bannerPng = Rswift.FileResource(bundle: R.hostingBundle, name: "banner", pathExtension: "png")
    /// Resource file `dog.jpg`.
    static let dogJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "dog", pathExtension: "jpg")
    /// Resource file `gitHubLogo.jpg`.
    static let gitHubLogoJpg = Rswift.FileResource(bundle: R.hostingBundle, name: "gitHubLogo", pathExtension: "jpg")
    /// Resource file `github-mark.png`.
    static let githubMarkPng = Rswift.FileResource(bundle: R.hostingBundle, name: "github-mark", pathExtension: "png")
    /// Resource file `swift-og.png`.
    static let swiftOgPng = Rswift.FileResource(bundle: R.hostingBundle, name: "swift-og", pathExtension: "png")
    /// Resource file `zorza-polarna-norwegia_330978.jpg`.
    static let zorzaPolarnaNorwegia_330978Jpg = Rswift.FileResource(bundle: R.hostingBundle, name: "zorza-polarna-norwegia_330978", pathExtension: "jpg")
    
    /// `bundle.url(forResource: "DfaihBBXUAACdWy.jpg-large", withExtension: "jpeg")`
    static func dfaihBBXUAACdWyJpgLargeJpeg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dfaihBBXUAACdWyJpgLargeJpeg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GoogleService-Info", withExtension: "plist")`
    static func googleServiceInfoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.googleServiceInfoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-Bold", withExtension: "otf")`
    static func gothamRoundedBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-BoldItalic", withExtension: "otf")`
    static func gothamRoundedBoldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBoldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-Book", withExtension: "otf")`
    static func gothamRoundedBookOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBookOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-BookItalic", withExtension: "otf")`
    static func gothamRoundedBookItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBookItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-Light", withExtension: "otf")`
    static func gothamRoundedLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-LightItalic", withExtension: "otf")`
    static func gothamRoundedLightItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedLightItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-Medium", withExtension: "otf")`
    static func gothamRoundedMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRounded-MediumItalic", withExtension: "otf")`
    static func gothamRoundedMediumItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedMediumItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRoundedBold_21016", withExtension: "ttf")`
    static func gothamRoundedBold_21016Ttf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBold_21016Ttf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRoundedBook_21018", withExtension: "ttf")`
    static func gothamRoundedBook_21018Ttf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedBook_21018Ttf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRoundedLight_21020", withExtension: "ttf")`
    static func gothamRoundedLight_21020Ttf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedLight_21020Ttf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "GothamRoundedMedium_21022", withExtension: "ttf")`
    static func gothamRoundedMedium_21022Ttf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gothamRoundedMedium_21022Ttf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "ada-lovelace", withExtension: "jpg")`
    static func adaLovelaceJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.adaLovelaceJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "banner", withExtension: "png")`
    static func bannerPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.bannerPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "dog", withExtension: "jpg")`
    static func dogJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.dogJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "gitHubLogo", withExtension: "jpg")`
    static func gitHubLogoJpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.gitHubLogoJpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "github-mark", withExtension: "png")`
    static func githubMarkPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.githubMarkPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "swift-og", withExtension: "png")`
    static func swiftOgPng(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.swiftOgPng
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "zorza-polarna-norwegia_330978", withExtension: "jpg")`
    static func zorzaPolarnaNorwegia_330978Jpg(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.zorzaPolarnaNorwegia_330978Jpg
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 12 fonts.
  struct font: Rswift.Validatable {
    /// Font `GothamRounded-BoldItalic`.
    static let gothamRoundedBoldItalic = Rswift.FontResource(fontName: "GothamRounded-BoldItalic")
    /// Font `GothamRounded-BookItalic`.
    static let gothamRoundedBookItalic = Rswift.FontResource(fontName: "GothamRounded-BookItalic")
    /// Font `GothamRounded-LightItalic`.
    static let gothamRoundedLightItalic = Rswift.FontResource(fontName: "GothamRounded-LightItalic")
    /// Font `GothamRounded-MediumItalic`.
    static let gothamRoundedMediumItalic = Rswift.FontResource(fontName: "GothamRounded-MediumItalic")
    
    /// `UIFont(name: "GothamRounded-BoldItalic", size: ...)`
    static func gothamRoundedBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBoldItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-BookItalic", size: ...)`
    static func gothamRoundedBookItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedBookItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-LightItalic", size: ...)`
    static func gothamRoundedLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedLightItalic, size: size)
    }
    
    /// `UIFont(name: "GothamRounded-MediumItalic", size: ...)`
    static func gothamRoundedMediumItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: gothamRoundedMediumItalic, size: size)
    }
    
    static func validate() throws {
      if R.font.gothamRoundedLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-LightItalic' could not be loaded, is 'GothamRounded-LightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedBookItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-BookItalic' could not be loaded, is 'GothamRounded-BookItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-BoldItalic' could not be loaded, is 'GothamRounded-BoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.gothamRoundedMediumItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'GothamRounded-MediumItalic' could not be loaded, is 'GothamRounded-MediumItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `DfaihBBXUAACdWy.jpg-large.jpeg`.
    static let dfaihBBXUAACdWyJpgLargeJpeg = Rswift.ImageResource(bundle: R.hostingBundle, name: "DfaihBBXUAACdWy.jpg-large.jpeg")
    /// Image `ada-lovelace.jpg`.
    static let adaLovelaceJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "ada-lovelace.jpg")
    /// Image `banner`.
    static let banner = Rswift.ImageResource(bundle: R.hostingBundle, name: "banner")
    /// Image `dog.jpg`.
    static let dogJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "dog.jpg")
    /// Image `gitHubLogo.jpg`.
    static let gitHubLogoJpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "gitHubLogo.jpg")
    /// Image `github-mark`.
    static let githubMark = Rswift.ImageResource(bundle: R.hostingBundle, name: "github-mark")
    /// Image `swift-og`.
    static let swiftOg = Rswift.ImageResource(bundle: R.hostingBundle, name: "swift-og")
    /// Image `zorza-polarna-norwegia_330978.jpg`.
    static let zorzaPolarnaNorwegia_330978Jpg = Rswift.ImageResource(bundle: R.hostingBundle, name: "zorza-polarna-norwegia_330978.jpg")
    
    /// `UIImage(named: "DfaihBBXUAACdWy.jpg-large.jpeg", bundle: ..., traitCollection: ...)`
    static func dfaihBBXUAACdWyJpgLargeJpeg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dfaihBBXUAACdWyJpgLargeJpeg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "ada-lovelace.jpg", bundle: ..., traitCollection: ...)`
    static func adaLovelaceJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.adaLovelaceJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "banner", bundle: ..., traitCollection: ...)`
    static func banner(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.banner, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "dog.jpg", bundle: ..., traitCollection: ...)`
    static func dogJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.dogJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "gitHubLogo.jpg", bundle: ..., traitCollection: ...)`
    static func gitHubLogoJpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.gitHubLogoJpg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "github-mark", bundle: ..., traitCollection: ...)`
    static func githubMark(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.githubMark, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "swift-og", bundle: ..., traitCollection: ...)`
    static func swiftOg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.swiftOg, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "zorza-polarna-norwegia_330978.jpg", bundle: ..., traitCollection: ...)`
    static func zorzaPolarnaNorwegia_330978Jpg(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.zorzaPolarnaNorwegia_330978Jpg, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 12 nibs.
  struct nib {
    /// Nib `FeedHeaderView`.
    static let feedHeaderView = _R.nib._FeedHeaderView()
    /// Nib `FeedTableViewCell`.
    static let feedTableViewCell = _R.nib._FeedTableViewCell()
    /// Nib `FeedView`.
    static let feedView = _R.nib._FeedView()
    /// Nib `GitHubLoginView`.
    static let gitHubLoginView = _R.nib._GitHubLoginView()
    /// Nib `HeaderSectionView`.
    static let headerSectionView = _R.nib._HeaderSectionView()
    /// Nib `HighlightedTableViewCell`.
    static let highlightedTableViewCell = _R.nib._HighlightedTableViewCell()
    /// Nib `LoginView`.
    static let loginView = _R.nib._LoginView()
    /// Nib `MostReadCollectionViewCell`.
    static let mostReadCollectionViewCell = _R.nib._MostReadCollectionViewCell()
    /// Nib `MostReadTableViewCell`.
    static let mostReadTableViewCell = _R.nib._MostReadTableViewCell()
    /// Nib `OnboardingView`.
    static let onboardingView = _R.nib._OnboardingView()
    /// Nib `ProfileView`.
    static let profileView = _R.nib._ProfileView()
    /// Nib `WebContainerView`.
    static let webContainerView = _R.nib._WebContainerView()
    
    /// `UINib(name: "FeedHeaderView", in: bundle)`
    static func feedHeaderView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.feedHeaderView)
    }
    
    /// `UINib(name: "FeedTableViewCell", in: bundle)`
    static func feedTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.feedTableViewCell)
    }
    
    /// `UINib(name: "FeedView", in: bundle)`
    static func feedView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.feedView)
    }
    
    /// `UINib(name: "GitHubLoginView", in: bundle)`
    static func gitHubLoginView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.gitHubLoginView)
    }
    
    /// `UINib(name: "HeaderSectionView", in: bundle)`
    static func headerSectionView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.headerSectionView)
    }
    
    /// `UINib(name: "HighlightedTableViewCell", in: bundle)`
    static func highlightedTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.highlightedTableViewCell)
    }
    
    /// `UINib(name: "LoginView", in: bundle)`
    static func loginView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loginView)
    }
    
    /// `UINib(name: "MostReadCollectionViewCell", in: bundle)`
    static func mostReadCollectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.mostReadCollectionViewCell)
    }
    
    /// `UINib(name: "MostReadTableViewCell", in: bundle)`
    static func mostReadTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.mostReadTableViewCell)
    }
    
    /// `UINib(name: "OnboardingView", in: bundle)`
    static func onboardingView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.onboardingView)
    }
    
    /// `UINib(name: "ProfileView", in: bundle)`
    static func profileView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.profileView)
    }
    
    /// `UINib(name: "WebContainerView", in: bundle)`
    static func webContainerView(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.webContainerView)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 4 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `FeedTableViewCell`.
    static let feedTableViewCell: Rswift.ReuseIdentifier<FeedTableViewCell> = Rswift.ReuseIdentifier(identifier: "FeedTableViewCell")
    /// Reuse identifier `HighlightedTableViewCell`.
    static let highlightedTableViewCell: Rswift.ReuseIdentifier<HighlightedTableViewCell> = Rswift.ReuseIdentifier(identifier: "HighlightedTableViewCell")
    /// Reuse identifier `MostReadCollectionViewCell`.
    static let mostReadCollectionViewCell: Rswift.ReuseIdentifier<MostReadCollectionViewCell> = Rswift.ReuseIdentifier(identifier: "MostReadCollectionViewCell")
    /// Reuse identifier `MostReadTableViewCell`.
    static let mostReadTableViewCell: Rswift.ReuseIdentifier<MostReadTableViewCell> = Rswift.ReuseIdentifier(identifier: "MostReadTableViewCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
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
    try nib.validate()
  }
  
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _HighlightedTableViewCell.validate()
      try _FeedView.validate()
      try _ProfileView.validate()
    }
    
    struct _FeedHeaderView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "FeedHeaderView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _FeedTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = FeedTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "FeedTableViewCell"
      let name = "FeedTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> FeedTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? FeedTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _FeedView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "FeedView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "zorza-polarna-norwegia_330978.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'zorza-polarna-norwegia_330978.jpg' is used in nib 'FeedView', but couldn't be loaded.") }
        if UIKit.UIImage(named: "ada-lovelace.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ada-lovelace.jpg' is used in nib 'FeedView', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _GitHubLoginView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "GitHubLoginView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _HeaderSectionView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "HeaderSectionView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> HeaderSectionView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HeaderSectionView
      }
      
      fileprivate init() {}
    }
    
    struct _HighlightedTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = HighlightedTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "HighlightedTableViewCell"
      let name = "HighlightedTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> HighlightedTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? HighlightedTableViewCell
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "dog.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'dog.jpg' is used in nib 'HighlightedTableViewCell', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _LoginView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "LoginView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _MostReadCollectionViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = MostReadCollectionViewCell
      
      let bundle = R.hostingBundle
      let identifier = "MostReadCollectionViewCell"
      let name = "MostReadCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> MostReadCollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MostReadCollectionViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _MostReadTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = MostReadTableViewCell
      
      let bundle = R.hostingBundle
      let identifier = "MostReadTableViewCell"
      let name = "MostReadTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> MostReadTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? MostReadTableViewCell
      }
      
      fileprivate init() {}
    }
    
    struct _OnboardingView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "OnboardingView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    struct _ProfileView: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "ProfileView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "ada-lovelace.jpg", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'ada-lovelace.jpg' is used in nib 'ProfileView', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct _WebContainerView: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "WebContainerView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIKit.UIView? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIKit.UIView
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  struct storyboard {
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
