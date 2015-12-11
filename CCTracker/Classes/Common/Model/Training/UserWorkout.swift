//
//  UserWorkout.swift
//  CCTracker
//
//  Created by Ricardo on 10/1/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class UserWorkout {

  var currentSteps = [String:Int]()
  
  init(){
    let defaults = NSUserDefaults.standardUserDefaults()
    if let steps = defaults.dictionaryForKey(Defaults.currentSteps) as? [String:Int]{
      currentSteps = steps
    }else{
      currentSteps[Movements.Pushup]    = 0
      currentSteps[Movements.Squat]     = 0
      currentSteps[Movements.Pullup]    = 0
      currentSteps[Movements.LegRaise]  = 0
      currentSteps[Movements.Bridge]    = 0
      currentSteps[Movements.Handstand] = 0
      saveCurrentSteps()
    }
  }
  
  
  //Take out this method to a Data Manager
  func saveCurrentSteps() {
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(currentSteps, forKey: Defaults.currentSteps)
    defaults.synchronize()
  }

  func getCurrentStepforMovement(movement:String) ->Int {
    return currentSteps[movement]!
  }
  
}