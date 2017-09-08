//
//  AppDelegate.swift
//  CornellaApp
//
//  Created by Juan Morillo on 20/6/17.
//  Copyright © 2017 Juan Morillo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    //Personalizar l barra de navegación, toda la apariencia.
    
    UINavigationBar.appearance().barTintColor = UIColor(colorLiteralRed: 240.0/255.0, green: 112.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    UINavigationBar.appearance().tintColor = UIColor.white
    
    if let barFont = UIFont(name: "Avenir-Light", size: 22.0) {
      
      UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white, NSFontAttributeName : barFont]
      
    }
    
    UITabBar.appearance().tintColor = UIColor(colorLiteralRed: 240.0/255.0, green: 112.0/255.0, blue: 115.0/255.0, alpha: 1.0)
    UITabBar.appearance().barTintColor = UIColor.darkGray
    //UITabBar.appearance().selectionIndicatorImage = UIImage(named: "imagen.jpg")
    
    
    sleep(3)
    
    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

