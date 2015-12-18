//
//  File.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Movement : NSObject{
  
  var name: String
  var exercises = [Exercise]()
  var iconMovement: String
  var currentStep:Int
  
  init (movementName name:String, movementIcon icon:String, currentStep:Int){
    self.name = name
    self.currentStep = currentStep
    iconMovement = icon
  }


  internal func getStepInfo() ->[String] {
    var info = [String]()
    info.append(stepNames[currentStep])
    info.append(exercises[currentStep].name)
    return info
  }
  
  func getCurrentExercise() -> Exercise {
    return exercises[currentStep]
  }
  
  static func createMovementWithName(movementName: String) -> Movement {
    if movementName == Movements.Pushup {
      return Pushup()
    } else if movementName == Movements.Squat {
      return Squat()
    } else if movementName == Movements.Pullup {
      return Pullup()
    } else if movementName == Movements.LegRaise {
      return LegRaise()
    } else if movementName == Movements.Bridge {
      return Bridge()
    } else {
      return Handstand()
    }
  }
  
}
