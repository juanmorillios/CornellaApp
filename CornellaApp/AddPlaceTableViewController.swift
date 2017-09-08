//
//  AddPlaceTableViewController.swift
//  CornellaApp
//
//  Created by Juan Morillo on 26/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class AddPlaceTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
  @IBOutlet var imageView: UIImageView!
  
  @IBOutlet var nombreLugarTextField: UITextField!
  
  @IBOutlet var tipoDeLugarTextField: UITextField!
  
  @IBOutlet var direccionTextField: UITextField!
  
  @IBOutlet var numeroTelefonoTextField: UITextField!
  
  @IBOutlet var paginaWebTextField: UITextField!
  
  @IBOutlet var noMeGusta: UIButton!
  
  @IBOutlet var meGusta: UIButton!
  
  @IBOutlet var meEncanta: UIButton!
  
  var rating : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    nombreLugarTextField.delegate = self
    tipoDeLugarTextField.delegate = self
    direccionTextField.delegate = self
    numeroTelefonoTextField.delegate = self
    paginaWebTextField.delegate = self
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if indexPath.row == 0 {
      
      if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
        
      }
      
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
    
  }
  
  func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    self.imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    self.imageView.contentMode = .scaleAspectFill
    self.imageView.clipsToBounds = true
    
    
    //Aplicando Autolayout para ajustar la imagen a borde cero.
    let leadingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .leading, relatedBy: .equal, toItem: self.imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
    leadingConstrain.isActive = true
    
    let trailingConstrain = NSLayoutConstraint(item: self.imageView, attribute: .trailing, relatedBy: .equal, toItem: self.imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
    trailingConstrain.isActive = true
    
    let topConstrain = NSLayoutConstraint(item: self.imageView, attribute: .top, relatedBy: .equal, toItem: self.imageView.superview, attribute: .top, multiplier: 1, constant: 0)
    topConstrain.isActive = true
    
    let bottomConstrain = NSLayoutConstraint(item: self.imageView, attribute: .bottom, relatedBy: .equal, toItem: self.imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
    bottomConstrain.isActive = true
    
    dismiss(animated: true, completion: nil)
    
  }
  
  let defaultColor = UIColor(displayP3Red: 255.0/255.0, green: 135.0/255.0, blue: 2.0/255.0, alpha: 1.0)
  
  let selectColor = UIColor(displayP3Red: 110.0/255.0, green: 175.0/255.0, blue: 38.0/255.0, alpha: 1.0)
  
  
  @IBAction func btnRatingsPressed(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      self.rating = "dislike"
      self.noMeGusta.backgroundColor = selectColor
      self.meGusta.backgroundColor = defaultColor
      self.meEncanta.backgroundColor = defaultColor
      
    case 2:
      self.rating = "good"
      self.noMeGusta.backgroundColor = defaultColor
      self.meGusta.backgroundColor = selectColor
      self.meEncanta.backgroundColor = defaultColor
      
    case 3:
      self.rating = "great"
      self.noMeGusta.backgroundColor = defaultColor
      self.meGusta.backgroundColor = defaultColor
      self.meEncanta.backgroundColor = selectColor
      
    default:
      break
    }
    
    
  }
  
  @IBAction func btnSavePressed(_ sender: UIBarButtonItem) {
    
    if let nombreLugar = self.nombreLugarTextField.text, let tipoDeLugar = self.tipoDeLugarTextField.text,
      let direccion = self.direccionTextField.text,
      let numeroTelefono = self.numeroTelefonoTextField.text,
      let paginaWeb = self.paginaWebTextField.text,
      let imagen = self.imageView.image,
      let rating = self.rating {
      
      let place = Place(name: nombreLugar, type: tipoDeLugar, location: direccion, image: imagen, telephone: numeroTelefono, webSite: paginaWeb)
      place.rating = rating
      print(place.name)
      
      self.performSegue(withIdentifier: "unwindSegueToMainView", sender: self)
      
    } else {
      
      mensajeDeAlerta()
      
    }
    
  }
  
  func mensajeDeAlerta() {
    
    let alert = UIAlertController(title: "Aviso", message: "No puede dejar los campos vacios, por favor rellenarlo", preferredStyle: .alert)
    
    let actionOK = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
    
    alert.addAction(actionOK)
    
    present(alert, animated: true, completion: nil)
    
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}



