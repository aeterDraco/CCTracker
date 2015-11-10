//
//  TrainingView.swift
//  CCTracker
//
//  Created by Ricardo on 10/2/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import UIKit

@IBDesignable class TrainingView: UIView {

  @IBOutlet var view: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var thisSwitch: UISwitch!
  @IBAction func switchTapped(sender: UISwitch) {
    print("switch from cell \(sender.tag) changed to turned \(sender.on)")
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    NSBundle.mainBundle().loadNibNamed("TrainingView", owner: self, options: nil)
    
    self.view.frame = bounds
    self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    
    self.addSubview(self.view)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    NSBundle.mainBundle().loadNibNamed("TrainingView", owner: self, options: nil)
    
    self.view.frame = bounds
    self.view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    
    self.addSubview(self.view)
  }

  
  
}
