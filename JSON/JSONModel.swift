// JSONModel.swift
// JSON
// Created by John Christopher Ferris
// Copyright © 2019 sub11 LLC. All rights reserved.

import Foundation

protocol JSONModelDelegate: class {
  func alert(title: String?, message: String?)
  func updateView(issLocation: ISSLocation)
}

class JSONModel: NSObject {
  weak var delegate: JSONModelDelegate?
  let url = URL(string: "https://api.wheretheiss.at/v1/satellites/25544")!

  func updateData() {
    let queue = DispatchQueue(label: "jsonQueue")
    queue.async {
      let task = URLSession.shared.dataTask(with: self.url) { data, response, error in
        if let error = error {
          self.delegate?.alert(title: "Error", message: error.localizedDescription)
          return
        }
        guard let data = data else {
          self.delegate?.alert(title: "Error", message: "Data Error")
          return
        }
        do {
          let issLocation = try JSONDecoder().decode(ISSLocation.self, from: data)
          DispatchQueue.main.async {
            self.delegate?.updateView(issLocation: issLocation)
          }
        } catch {
          self.delegate?.alert(title: "Error", message: error.localizedDescription)
        }
      }
      task.resume()
    }
  }
}
