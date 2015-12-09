//
//  AppDependencies.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 23/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies {
  
  init() {
  }
  
  func createMenuView(window: UIWindow) {
    
//    let appRouter = AppRouter()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    let mainViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Home) as! HomeView
    let leftViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Menu) as! MenuModuleView
    
    let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
    nvc.navigationBarHidden = true
    
    leftViewController.homeViewController = nvc
//    mainViewController.delegate = leftViewController
    let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
    
    window.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
    window.rootViewController = slideMenuController
    window.makeKeyAndVisible()
  }
  
}