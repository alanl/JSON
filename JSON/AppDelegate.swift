// AppDelegate.swift
// JSON
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = Library.navigationController(rootController: ISSController())
    window?.makeKeyAndVisible()
    return true
  }
}
