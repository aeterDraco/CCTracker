//
//  AppWireFrameManager.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 26/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

protocol AppRoutingProtocol: class {
  
}

class AppRouter {

  static let sharedInstance = AppRouter()
  
  private var window: UIWindow?

  private init(){
    print("AppRouter initialized")
  }
  
  func initAppWindow(appWindow: UIWindow) {
    self.window = appWindow
    print("Approuter window set to \(self.window)")
  }
  
  func instantiateViewController(viewControllerId: String) -> UIViewController{
    print("AppRouter instantiateViewController with \(viewControllerId)")
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let newViewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerId)
    return newViewController
  }

  func instantiateRootModuleIntoWindow() {
    let leftViewController = MenuModuleWireFrame.initializeModule()
    let mainViewController = HomeWireFrame.initializeModule(leftViewController)
    let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
    nvc.navigationBarHidden = true
    
    leftViewController.homeViewController = nvc
    mainViewController.delegate = leftViewController
    let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftViewController)
    
    self.window!.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
    self.window!.rootViewController = slideMenuController
    self.window!.makeKeyAndVisible()
  }
  
  
  func fetchViewControllerWithDelegate(menu: LeftMenu, leftMenuProtocol: LeftMenuProtocol) -> UIViewController {
    switch menu {
      case .Home:
        return HomeWireFrame.initializeModule(leftMenuProtocol)
      case .Schedule:
        return ScheduleWireFrame.initializeModule(leftMenuProtocol)
    default:
      return UIViewController()
      break
      
//      case .Exercise:
//        slideMenu.changeMainViewController(self.exerciseViewController, close: true)
//        break
//      case .Progression:
//        slideMenu.changeMainViewController(self.progressionViewController, close: true)
//        break
//      case .Settings:
//        slideMenu.changeMainViewController(self.settingsViewController, close: true)
//        break
    }
  }
  
  
//  func installViewController(newViewController: ViewProtocol) {
//    self.installRootViewControllerInWindow(newViewController, window: self.window!)
//  }
  
  
  func installMenuViewControllerInWindow(leftMenuView: MenuModuleView, window: UIWindow) {
    
//    let mainViewController = HomeWireFrame.initializeHomeModule() as! UIViewController
//    let nvc: UINavigationController = UINavigationController(rootViewController: mainViewController)
//    nvc.navigationBarHidden = true
//    
//    leftMenuView.homeViewController = nvc
//    //    mainViewController.delegate = leftMenuView
//    let slideMenuController = SlideMenuController(mainViewController:nvc, leftMenuViewController: leftMenuView)
//    
//    window.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
//    window.rootViewController = slideMenuController
//    window.makeKeyAndVisible()
  }
  

}