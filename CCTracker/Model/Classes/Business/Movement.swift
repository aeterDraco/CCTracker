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
  var currentStep:Int
  
  init (movementName name:String, movementIcon icon:String, currentStep:Int){
    self.name = name
    self.currentStep = currentStep
    iconMovement = UIImage(named: icon)!
  }


  internal func getStepInfo() ->[String] {
    var info = [String]()
    info.append(stepNames[currentStep])
    info.append(exercises[currentStep].name)
    return info
  }
  
}
