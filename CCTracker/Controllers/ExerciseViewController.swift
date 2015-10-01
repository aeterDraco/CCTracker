//
//  ExerciseViewController.swift
//  CCTracker
//
//  Created by Ricardo on 9/30/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ExerciseViewController : UIViewController {
  
  @IBOutlet weak var btnMenu: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    btnMenu .addTarget(self, action: "toggleLeft", forControlEvents: UIControlEvents.TouchUpInside)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBarHidden = true
  }

}