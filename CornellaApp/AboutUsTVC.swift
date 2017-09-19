//
//  AboutUsTVC.swift
//  CornellaApp
//
//  Created by Juan Morillo on 12/9/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit
import SafariServices

class AboutUsTVC: UITableViewController {
  
  //TODO: Falta implementar
  var aboutUS : [AboutUS] = []
  let sections = ["Dejar valoración",
                  "Siguenos en redes sociales"]
  let sectionContent = [["Valorar en el App Store",
                         "Déjanos tu feedback"],
                        ["Facebook", "Twitter", "Instagram"]]
  let sectionLinks = [["https://itunes.apple.com/es/app/fasttaps/id1153034861?mt=8",
                       "http://juanmorillios.com/aboutme/"],
                      ["https://facebook.com/juanmorillios",
                       "https://twitter.com/juanmorillios",
                       "https://www.instagram.com/juanmorillios/"]]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
  }
 
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return self.sections.count
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.sectionContent[section].count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AboutAsCell", for: indexPath)
    let cellContent = self.sectionContent[indexPath.section][indexPath.row]
    cell.textLabel?.text = cellContent
    return cell
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return self.sections[section]
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.section {
    case 0:
      switch indexPath.row {
    case 0:
        if let appStoreURL = URL(string:self.sectionLinks[0][0])  {
          let app = UIApplication.shared
          if app.canOpenURL(appStoreURL) {
            app.open(appStoreURL, options: [:], completionHandler: nil)
          }
        }
    case 1:
        performSegue(withIdentifier: "showWebView", sender: self.sectionLinks[0][1])
      default:
        break
      }
    case 1:
      if let url = URL(string: self.sectionLinks[1][indexPath.row]) {
        let safariViewcontroller = SFSafariViewController(url: url)
        present(safariViewcontroller, animated: true, completion: nil)
      }
    default:
      break
    }
    self.tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showWebView" {
      let destinationVC = segue.destination as! WebViewVC
      destinationVC.urlName = sender as! String
    }
  }
}
