//
//  RecipeCell.swift
//  Recetas
//
//  Created by Juan Morillo on 8/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
  
  @IBOutlet var imageRecipeCell: UIImageView!
  @IBOutlet var titleRecipeLabel: UILabel!
  @IBOutlet var timeLabel: UILabel!
  
  @IBOutlet var ingridientsLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
