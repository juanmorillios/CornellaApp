//
//  ReviewViewController.swift
//  Recetas
//
//  Created by Juan Morillo on 13/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
  
  @IBOutlet var bgImageView: UIImageView!
  @IBOutlet var ratingStackView: UIStackView!
  var ratingSelected : String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let blurEffect = UIBlurEffect(style: .regular)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    bgImageView.addSubview(blurEffectView)
    
    //Aplicando animación a la pantalla ratings
    let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)
    let translation = CGAffineTransform(translationX: 0.0, y: 700.0)
    
    ratingStackView.transform = scale.concatenating(translation) // combinar escalado con traslación
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //usingSpringWithDampping
    
    //    UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
    //
    ////      self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    //
    //
    //    }, completion: nil)
    
    
    UIView.animateKeyframes(withDuration: 0.9, delay: 0.0, options: .calculationModeCubic, animations: {
      self.ratingStackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    }, completion: nil)
    
  }
  override var prefersStatusBarHidden: Bool {
    
    return true
    
  }
  
  @IBAction func btnRatingPressed(_ sender: UIButton) {
    
    switch sender.tag {
    case 1:
      ratingSelected = "dislike"
    case 2:
      ratingSelected = "good"
    case 3:
      ratingSelected = "great"
    default:
      break
    }
    performSegue(withIdentifier: "unwindToDetailView", sender: sender)
  }
  
}
