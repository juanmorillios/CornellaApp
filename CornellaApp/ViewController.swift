//
//  HomeViewController.swift
//  Recetas
//
//  Created by Juan Morillo on 8/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var places : [Place] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    
    var place = Place(name: "Parque Can Mercader", type: "Parque", location: "08940 Cornellà de Llobregat Barcelona, España", image: #imageLiteral(resourceName: "canmercader"), telephone: "3467894", webSite: "www.website.com")
    places.append(place)
    
    place = Place(name: "Santa Maria de Cornella (1940)", type: "Parroquia", location: "Pasaje de Mossèn Jaume Rafanell, 4 08940 Cornellà de Llobregat Barcelona, España", image: #imageLiteral(resourceName: "Santa Maria de Cornella"), telephone: "3467894", webSite: "www.website.com")
    places.append(place)
    
    place = Place(name: "Angel Guimerà", type: "Plaza", location: "08940 Cornellà de Llobregat Barcelona, España", image: #imageLiteral(resourceName: "Plaza Angel Guimerà"), telephone: "3467894", webSite: "www.website.com")
    places.append(place)
    
    place = Place(name: "Riu Llobregat", type: "Parque", location: "08820 El Prat de Llobregat Barcelona, España", image: #imageLiteral(resourceName: "Parc Fluvial del Riu Llobregat"), telephone: "3467894", webSite: "www.website.com")
    places.append(place)
    
    place = Place(name: "Torre de la Miranda", type: "Torre", location: "Av. Salvador Allende", image: #imageLiteral(resourceName: "TorreDeLaMiranda"), telephone: "691208356", webSite: "https://es.wikipedia.org/wiki/Torre_de_la_Miranda")
    places.append(place)
    
    place = Place(name: "Estadio del RCD Español ", type: "Estadio", location: "Av. Baix Llobregat, 100. 08940 Cornellà de Llobregat", image: #imageLiteral(resourceName: "EstadioRCDE"), telephone: "93 292 77 00", webSite: "https://www.rcdespanyol.com/es/instalaciones/")
    places.append(place)
    
    place = Place(name: "Castell de Cornellà", type: "Castillo", location: "C. Mossèn Jacint Verdaguer, s/n, 08940 Cornellà de Llobre, Barcelona", image: #imageLiteral(resourceName: "Castillo de Cornella"), telephone: "934 74 51 35", webSite: "http://www.castillosnet.org/espana/informacion.php?ref=B-CAS-162")
    places.append(place)
    
    
    place = Place(name: "Can Cuixart", type: "Monumento", location: "08940 Rambla Anselm Clavé, 18", image: #imageLiteral(resourceName: "CanCuxart"), telephone: "8568765875768", webSite: "www.cancuixart.com")
    places.append(place)
    
    navigationController?.hidesBarsOnSwipe = true
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnSwipe = true
  }
  
  //MARK: UITableViweDataSource
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.places.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let place = places[indexPath.row]
    let cellID = "PlaceCell"
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PlaceCell
    
    cell.titlePlaceLabel.text = place.name
    cell.imagePlaceCell.image = place.image
    cell.timeLabel.text = place.type
    cell.placeLabel.text = place.location
    return cell
  }
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    
    if editingStyle == .delete {
      self.places.remove(at: indexPath.row)
    }
    self.tableView.deleteRows(at: [indexPath], with: .fade)
  }
  
  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    
    //Shared
    let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
      
      let place = self.places[indexPath.row]
      let shareDefaultText = "Estoy mirando el lugar : \(place.name) de la ciudad de cornella "
      
      let activityViewController = UIActivityViewController(activityItems: [shareDefaultText, self.places[indexPath.row].image, self.places[indexPath.row].location], applicationActivities: nil)
      self.present(activityViewController, animated: true, completion: nil)
    }
    
    shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255, alpha: 1.0)
    
    //Delete
    
    let deleteAction = UITableViewRowAction(style: .destructive, title: "Borrar") { (action, indexPath) in
      
      self.places.remove(at: indexPath.row)
      self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    deleteAction.backgroundColor = UIColor(displayP3Red: 202.0/255.0, green: 202.0/255.0, blue: 202.0/255.0, alpha: 1.0)
    return [shareAction, deleteAction]
    
  }
  
  //MARK: UITableViewDelegate
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if segue.identifier == "ShowDetail" {
      if let indexpath = self.tableView.indexPathForSelectedRow {
        let selectedPlace = self.places[indexpath.row]
        let destinationViewController = segue.destination as! DetailViewController
        destinationViewController.place = selectedPlace
      }
      
    }
    
  }
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  @IBAction func unwindSegueToMainView(segue: UIStoryboardSegue) {
    
  }
  
}




