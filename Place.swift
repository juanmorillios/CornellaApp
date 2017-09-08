//
//  Place.swift
//  CornellaApp
//
//  Created by Juan Morillo on 20/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import Foundation
import UIKit

class Place {
  var name = ""
  var type = ""
  var location = ""
  var telephone = ""
  var webSite = ""
  var rating = "rating"
  var image : UIImage
  
  init(name: String, type: String, location: String, image: UIImage, telephone: String, webSite: String) {
    self.name = name
    self.type = type
    self.location = location
    self.image = image
    self.telephone = telephone
    self.webSite = webSite

  }
  
}
