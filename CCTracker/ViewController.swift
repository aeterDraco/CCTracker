//
//  ViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/28/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {

  private var homeSelectedObserver: NSObjectProtocol!
  private var scheduleSelectedObserver: NSObjectProtocol!
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    addObservers()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    removeObservers()
  }
  
  private func addObservers() {
    let center = NSNotificationCenter.defaultCenter()
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    homeSelectedObserver = center.addObserverForName(Notifications.HomeSelected, object: nil, queue: nil) { (notification: NSNotification!) in
      let mvc = storyboard.instantiateViewControllerWithIdentifier(ViewId.Home)
      self.setViewControllers([mvc], animated: true)
    }
    
    scheduleSelectedObserver = center.addObserverForName(Notifications.ScheduleSelected, object: nil, queue: nil) { (notification: NSNotification!) in
      let mvc = storyboard.instantiateViewControllerWithIdentifier(ViewId.Schedule)
      self.setViewControllers([mvc], animated: true)
    }
  }
  
  private func removeObservers() {
    let center = NSNotificationCenter.defaultCenter()
    
    center.removeObserver(homeSelectedObserver)
    center.removeObserver(scheduleSelectedObserver)
  }

}

