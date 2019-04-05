// Library.swift
// JSON
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

struct ISSLocation: Codable {
  let latitude: Double
  let longitude: Double
  let altitude: Double
  let velocity: Double
  let visibility: String
}

struct Library {
  static let degreeUnicode = "\u{00B0}"
  static let marginSmall = CGFloat(8.0)
  static let marginLarge = CGFloat(25.0)
  static let backgroundColor = UIColor.black
  static let foregroundColor = UIColor.white

  static func activityIndicator() -> UIActivityIndicatorView {
    let activityIndicator = UIActivityIndicatorView(style: .white)
    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator.startAnimating()
    return activityIndicator
  }

  static func alertController(title: String?, message: String?) -> UIAlertController {
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
    return alertController
  }

  static func label(text: String, multiplier: CGFloat, textColor:UIColor) -> UILabel {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    label.font = label.font.withSize(label.font.pointSize * multiplier)
    label.textColor = textColor
    return label
  }

  static func navigationController(rootController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootController)
    navigationController.navigationBar.isTranslucent = false
    navigationController.navigationBar.barTintColor = Library.backgroundColor
    navigationController.navigationBar.tintColor = Library.foregroundColor
    navigationController.navigationBar.titleTextAttributes = [.foregroundColor : Library.foregroundColor]
    return navigationController
  }

  static func numberFormatter() -> NumberFormatter {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.minimumFractionDigits = 3
    numberFormatter.maximumFractionDigits = 3
    numberFormatter.alwaysShowsDecimalSeparator = true
    return numberFormatter
  }
}
