//
//  AboutUS.swift
//  CornellaApp
//
//  Created by Juan Morillo on 13/9/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import Foundation

class AboutUS {

  var sections: [String]?
  var sectionContent: [[String]]?
  var sectionLinks: [[String]]?

  init(sections: [String]?, sectionContent: [[String]]?, sectionLinks: [[String]]? ) {
  
    self.sections = sections
    self.sectionContent = sectionContent
    self.sectionLinks = sectionLinks
 
  }
 
}

 var arrayAboutUS: [[AboutUS]] = []
 var obj1 = AboutUS(sections: ["Dejar valoración", "Siguenos en redes sociales"], sectionContent: [["Valorar en el App Store", "Déjanos tu feedback"], ["Facebook", "Twitter"]], sectionLinks: [["https://itunes.apple.com/es/app/fasttaps/id1153034861?mt=8",""],
                                                                                                                                                                                                 ["https://facebook.com/juanmorillios", "https://twitter.com/juanmorillios"]])



