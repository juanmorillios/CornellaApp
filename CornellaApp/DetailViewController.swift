//
//  DetailViewController.swift
//  Recetas
//
//  Created by Juan Morillo on 12/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var placeImageView: UIImageView!
  @IBOutlet var tableView: UITableView!
  @IBOutlet var ratingButton: UIButton!
  
  var place: Place!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let image = UIImage(named: self.place.rating)
    self.ratingButton.setImage(image, for: .normal)
    
    self.placeImageView.image = self.place.image
    self.title = place.name
    
    //Redimencionar autmaticamente el ajuste de las celdas. Celdas autoajustable.
    self.tableView.estimatedRowHeight = 45.0
    self.tableView.rowHeight = UITableViewAutomaticDimension
    
    //Color de fondo de las celdas.
    self.tableView.backgroundColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
    
    //Toda fila que venga depues de la última, ponerla a cero.
    self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    
    //Cambiar separador por otro color
    self.tableView.separatorColor = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.75)
  }
  
}

extension DetailViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 5
  }
  
}

extension DetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceDetailViewCell", for: indexPath) as! PlaceDetailViewCell
    cell.backgroundColor = UIColor.clear
    
    switch indexPath.row {
    case 0:
      cell.keyLabel.text = "Nombre:"
      cell.valueLabel.text = self.place.name
    case 1:
      cell.keyLabel.text = "Tipo:"
      cell.valueLabel.text = self.place.type
    case 2:
      cell.keyLabel.text = "Localización:"
      
      cell.valueLabel.text = self.place.location
    case 3:
      cell.keyLabel.text = "Telefono:"
      cell.valueLabel.text = self.place.telephone
      
    case 4:
      cell.keyLabel.text = "WebSite:"
      cell.valueLabel.text = self.place.webSite
    default:
      break
    }
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 2:
      //Hemos seleccionado la geo localización
      self.performSegue(withIdentifier: "showMap", sender: nil)
      
    default:
      break
    }
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  @IBAction func close(segue: UIStoryboardSegue) {
    
    if let reviewVC = segue.source as? ReviewViewController {
      
      if let ratingN = reviewVC.ratingSelected {
        self.place.rating = ratingN
        let image = UIImage(named: self.place.rating)
        
        self.ratingButton.setImage(image, for: .normal)
        
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showMap" {
      
      let destination = segue.destination as? MapViewController
      destination?.place = self.place
      
    }
  }
  
  override var prefersStatusBarHidden: Bool {
    
    return true
    
  }
  
}
