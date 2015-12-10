//
//  MenuContainerViewController.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 09/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class MenuContainerViewController: UIViewController {
  
  var leftViewController: UIViewController? {
    willSet{
      if self.leftViewController != nil {
        if self.leftViewController!.view != nil {
          self.leftViewController!.view!.removeFromSuperview()
        }
        self.leftViewController!.removeFromParentViewController()
      }
    }
    
    didSet{
      self.view!.addSubview(self.leftViewController!.view)
      self.addChildViewController(self.leftViewController!)
    }
  }
  
  var rightViewController: UIViewController? {
    willSet {
      if self.rightViewController != nil {
        if self.rightViewController!.view != nil {
          self.rightViewController!.view!.removeFromSuperview()
        }
        self.rightViewController!.removeFromParentViewController()
      }
    }
    
    didSet{
      self.view!.addSubview(self.rightViewController!.view)
      self.addChildViewController(self.rightViewController!)
    }
  }
  
  var menuShown: Bool = false
  
  @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
    showMenu()
  }
  
  @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
    hideMenu()
  }
  
  func showMenu() {
    UIView.animateWithDuration(0.3, animations: {
      self.rightViewController!.view.frame = CGRectMake(self.view.frame.origin.x + 235, self.view.frame.origin.y, self.view.frame.width, self.view.frame.height)}, completion: { (Bool) -> Void in
        self.menuShown = true
    })
  }
  
  func hideMenu() {
    UIView.animateWithDuration(0.3, animations: {
      self.rightViewController!.view.frame = CGRectMake(0, self.view.frame.origin.y, self.view.frame.width, self.view.frame.height)}, completion: { (Bool) -> Void in
        self.menuShown = false
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let mainNavigationController: UINavigationController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Container) as! UINavigationController
    let menuViewController: MenuViewController = storyboard.instantiateViewControllerWithIdentifier(ViewId.Menu) as! MenuViewController
    
    self.leftViewController  = menuViewController
    self.rightViewController = mainNavigationController
  }
  
}

