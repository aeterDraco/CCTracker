//
//  Training.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Training: TrainingDataManagerProtocol {
  
  var isCCWorkout: Bool
  var schedule = [Days:[Movement]]()
  var name = String()
 
  init(){
    schedule    = [Days:[Movement]]()
    name        = String()
    isCCWorkout = false
  }

  init(trainingSchedule: [Days:[Movement]], trainingName: String, isCCWorkout: Bool) {
    self.name        = trainingName
    self.schedule    = trainingSchedule
    self.isCCWorkout = isCCWorkout
  }
  
  init(trainingInfo: [Int:[String]], trainingName: String, isCCWorkout: Bool) {
    self.schedule = [Days:[Movement]]()
    self.isCCWorkout = isCCWorkout

    for key in trainingInfo.keys {
      var movements = [Movement]()
      for movementName in trainingInfo[key]! {
        movements.append(Training.createMovementFromName(movementName))
      }
      
      let dayKey = DateManager.obtainDayName(weekDayInt: key)
      self.schedule[dayKey] = movements
    }
    self.name = trainingName
  }
  
  func currentStepForMovement(movementName:String) ->Int {
    return userWorkout.getCurrentStepforMovement(movementName)
  }
  
  func workoutList() -> [Movement] {
    var list = [Movement]()
    list.append(Pushup())
    list.append(Squat())
    list.append(Pullup())
    list.append(LegRaise())
    list.append(Bridge())
    list.append(Handstand())
    
    return list
  }

  //This function reads the stored workout program and returns an array whit the movements for the day
  
  func generateTrainingInfo() -> [String : [String]] {
    var dictionary = [String:[String]]()
    for dayKey in schedule.keys {
      var movementNames = [String]()
      for movement in schedule[dayKey]! {
        movementNames.append(movement.name)
      }
      dictionary["\(dayKey.rawValue)"] = movementNames
    }
    return dictionary
  }
  
  func getTrainingName() -> String {
    return self.name
  }
  
  func getCCWorkoutStatus() -> Bool {
    return self.isCCWorkout
  }
  
  static func createWorkoutWithSet(exercises:Set<Int>) ->[Days:[Movement]] {
    var workout = setMovementsInWorkout(exercises)
    for key in workout.keys {
      if workout[key]?.count == 0 {
        workout[key] = [Rest()]
      }
    }

    return workout
  }

//  static func createTrainingFromDictionary(dictionary:[String:[String]]) ->[String:[Movement]] {
//    var training = [String:[Movement]]()
//    
//    for key in dictionary.keys {
//      var movements = [Movement]()
//      for movementName in dictionary[key]! {
//        movements.append(createMovementFromName(movementName))
//      }
//      training[key] = movements
//    }
//    return training
//  }

  private static func createMovementFromName(movementName:String) ->Movement {
    if movementName == Movements.Pushup {
      return Pushup()
    }else if movementName == Movements.Squat {
      return Squat()
    }else if movementName == Movements.Pullup {
      return Pullup()
    }else if movementName == Movements.LegRaise {
      return LegRaise()
    }else if movementName == Movements.Bridge {
      return Bridge()
    }else if movementName == Movements.Handstand {
      return Handstand()
    }else {
      return Rest();
    }
  }
  
  private static func setMovementsInWorkout(trainingSet:Set<Int>) -> [Days:[Movement]] {
    var workout = [Days:[Movement]]()
    var mon  = [Movement]()
    var tue  = [Movement]()
    var wed  = [Movement]()
    var thu  = [Movement]()
    var fri  = [Movement]()
    var sat  = [Movement]()
    var sun  = [Movement]()
    
    for index in trainingSet {
      let movement    = getMovementFromValue(index)
      switch (index%7)+1 {
      case 1:
        mon.append(movement)
      case 2:
        tue.append(movement)
      case 3:
        wed.append(movement)
      case 4:
        thu.append(movement)
      case 5:
        fri.append(movement)
      case 6:
        sat.append(movement)
      case 7:
        sun.append(movement)
      default: break
      }
    }
    
    workout[Days.Monday]    = mon
    workout[Days.Tuesday]   = tue
    workout[Days.Wednesday] = wed
    workout[Days.Thursday]  = thu
    workout[Days.Friday]    = fri
    workout[Days.Saturday]  = sat
    workout[Days.Sunday]    = sun
    
    return workout
  }
  
  private static func getMovementFromValue(index:Int) -> Movement {
    if index < 7 {
      return Pushup()
    }else if index < 14 {
      return Squat()
    }else if index < 21 {
      return Pullup()
    }else if index < 28 {
      return LegRaise()
    }else if index < 35 {
      return Bridge()
    }else {
      return Handstand()
    }
  }

}