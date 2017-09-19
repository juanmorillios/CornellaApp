//
//  WebViewVC.swift
//  CornellaApp
//
//  Created by Juan Morillo on 19/9/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {
  @IBOutlet var webViewAboutUS: UIWebView!
  
  var urlName : String!

    override func viewDidLoad() {
        super.viewDidLoad()

      if let url = URL(string: urlName) {
          let request = URLRequest(url: url)
          self.webViewAboutUS.loadRequest(request)
      }
      
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
