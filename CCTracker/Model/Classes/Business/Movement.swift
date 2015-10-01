//
//  File.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class Movement{
  
  var name: String
  var exercises = [Exercise]()
  var iconMovement: UIImage
  
  init (movementName name:String, movementIcon icon:String){
    self.name = name
    iconMovement = UIImage(named: icon)!
  }
  
}
