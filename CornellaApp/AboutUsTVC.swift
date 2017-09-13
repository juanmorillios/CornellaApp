//
//  AboutUsTVC.swift
//  CornellaApp
//
//  Created by Juan Morillo on 12/9/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class AboutUsTVC: UITableViewController {
  
  //TODO: Falta implementar
  var aboutUS : [AboutUS] = []
  
  let sections = ["Dejar valoración", "Siguenos en redes sociales"]
  let sectionContent = [["Valorar en el App Store", "Déjanos tu feedback"], ["Facebook", "Twitter"]]
  let sectionLinks = [["https://itunes.apple.com/es/app/fasttaps/id1153034861?mt=8",""],
                      ["https://facebook.com/juanmorillios", "https://twitter.com/juanmorillios"]]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    
    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
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
      default:
        break
      }
    default:
      break
    }
    
    
    
  }
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
