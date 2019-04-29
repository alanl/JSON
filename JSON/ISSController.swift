// ISSController.swift
// JSON
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import UIKit

class ISSController: UIViewController, ISSModelDelegate {
  let issView = ISSView()
  let issModel = ISSModel()
  let numberFormatter = Library.numberFormatter()
  var timer: Timer!

  override func loadView() {
    super.loadView()
    title = "International Space Station"
    view = issView
    issModel.delegate = self
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
      self.issModel.updateData()
    }
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    timer.invalidate()
  }

  func updateView(issLocation: ISSLocation) {
    issView.activityIndicator.color = .clear
    issView.latitudeKey.textColor = Library.foregroundColor
    issView.latitudeValue.text = String(format: "%@ %@", self.numberFormatter.string(for: issLocation.latitude)!, Library.degreeUnicode)
    issView.longitudeKey.textColor = Library.foregroundColor
    issView.longitudeValue.text = String(format: "%@ %@", self.numberFormatter.string(for: issLocation.longitude)!, Library.degreeUnicode)
    issView.altitudeKey.textColor = Library.foregroundColor
    issView.altitudeValue.text = String(format: "%@ km", self.numberFormatter.string(for: issLocation.altitude)!)
    issView.velocityKey.textColor = Library.foregroundColor
    issView.velocityValue.text = String(format: "%@ kph", self.numberFormatter.string(for: issLocation.velocity)!)
    issView.visibilityKey.textColor = Library.foregroundColor
    issView.visibilityValue.text = issLocation.visibility
  }

  func alert(title: String?, message: String?) {
    self.present(Library.alertController(title: title, message: message), animated: true, completion: nil)
  }
}
