//
//  DetailViewController.swift
//  Recetas
//
//  Created by Juan Morillo on 12/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var recipeImageView: UIImageView!
  @IBOutlet var tableView: UITableView!
  @IBOutlet var ratingButton: UIButton!

  var recipe: Recipe!

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let image = UIImage(named: self.recipe.rating)
      self.ratingButton.setImage(image, for: .normal)

      self.recipeImageView.image = self.recipe.image
      self.title = recipe.name
      
      //Redimencionar autmaticamente el ajuste de las celdas. Celdas autoajustable.       
      self.tableView.estimatedRowHeight = 60.0
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
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    switch section {
    case 0:
      return 2
    case 1:
      return self.recipe.ingredients.count
    case 2:
      return self.recipe.steps.count
    default:
      return 0
    }
    
  }
  
}

extension DetailViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailRecipeCell", for: indexPath) as! RecipeDetailViewCell
    cell.backgroundColor = UIColor.clear
    
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0:
        cell.keyLabel.text = "Nombre:"
        cell.valueLabel.text = self.recipe.name
      case 1:
        cell.keyLabel.text = "Tiempo:"
        cell.valueLabel.text = "\(self.recipe.time!) min"
//      case 2:
//        cell.keyLabel.text = "Favorita"
//        
//        cell.valueLabel.text = self.recipe.isFavorite ? "Si" : "No"
        
        //      if self.recipe.isFavorite {
        //        cell.valueLabel.text = "Si"
        //      } else {
        //        cell.valueLabel.text = "No"
        //      }
        
      default:
        break
      }
      
    case 1:
      if indexPath.row == 0 {
        cell.keyLabel.text = "Ingredientes"
      }else{
        cell.keyLabel.text = ""
      }
      cell.valueLabel.text = self.recipe.ingredients[indexPath.row]
    case 2:
      if indexPath.row == 0 {
        cell.keyLabel.text = "Pasos:"
      }else{
        cell.keyLabel.text = ""
      }
      cell.valueLabel.text = self.recipe.steps[indexPath.row]
    default:
      break
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
    var title = ""
    
    switch section {
    case 1:
      title = "Ingredientes"
    case 2:
      title = "Pasos"
    default:
      break
    }
    return title
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  @IBAction func close(segue: UIStoryboardSegue) {
    
    if let reviewVC = segue.source as? ReviewViewController {
    
      if let ratingN = reviewVC.ratingSelected {
      self.recipe.rating = ratingN
        let image = UIImage(named: self.recipe.rating)
        
       self.ratingButton.setImage(image, for: .normal)
      
      }
    }
  }

  override var prefersStatusBarHidden: Bool {
  
    return true
  
  }
  
}
