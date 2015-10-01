//
//  Training.swift
//  CCTracker
//
//  Created by Ricardo on 9/29/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Training {
 
  init(){
    
  }
  
  //This function returns all the workouth schedule
  func getWorkoutSchedule() ->[String:[Movement]] {
    let defaults = NSUserDefaults.standardUserDefaults()
    if let scheduleData = defaults.dictionaryForKey(Defaults.schedule) as? [String:[String]]{
      let schedule:[String:[Movement]] = createTrainingFromDictionary(scheduleData)
      return schedule
    }else{
      return [String:[Movement]]()
    }
  }

  func getWorkoutName() ->String {
    let defaults = NSUserDefaults.standardUserDefaults()
    if let name = defaults.stringForKey(Defaults.workoutName){
      return name
    }else{
      return String()
    }
  }

  
  //This function reads the stored workout program and returns an array whit the movemnts for the day
  func readTodaysTraining() ->[Movement] {
    let defaults = NSUserDefaults.standardUserDefaults()
    if let scheduleData = defaults.dictionaryForKey(Defaults.schedule) as? [String:[String]]{
      let schedule:[String:[Movement]] = createTrainingFromDictionary(scheduleData)
      return schedule[getTodayKey()]!
    }else{
      return [Movement]()
    }
  }
  
  //Saving a workout
  func saveWorkout(workout:[String:[Movement]], workoutName:String) -> Bool {
    let workoutToSave = createDictionaryFromTraining(workout)
    let defaults = NSUserDefaults.standardUserDefaults()
    defaults.setObject(workoutToSave, forKey: Defaults.schedule)
    defaults.setObject(workoutName, forKey: Defaults.workoutName)
    return defaults.synchronize()
  }
  
  func createWorkoutWithSet(exercises:Set<Int>) ->[String:[Movement]] {
    var workout = setMovementsInWorkout(exercises)
    for key in workout.keys {
      if workout[key]?.count == 0 {
        workout[key] = [Rest()]
      }
    }

    return workout
  }
  
  func createDictionaryFromTraining(training:[String:[Movement]]) ->[String:[String]] {
    var dictionary = [String:[String]]()
    
    for key in training.keys {
      var movementNames = [String]()
      for movement in training[key]! {
        movementNames.append(movement.name)
      }
      dictionary[key] = movementNames
    }
    return dictionary
  }

  func createTrainingFromDictionary(dictionary:[String:[String]]) ->[String:[Movement]] {
    var training = [String:[Movement]]()
    
    for key in dictionary.keys {
      var movements = [Movement]()
      for movementName in dictionary[key]! {
        movements.append(createMovementFromName(movementName))
      }
      training[key] = movements
    }
    return training
  }

  func createMovementFromName(movementName:String) ->Movement {
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
  
  private func setMovementsInWorkout(trainingSet:Set<Int>) -> [String:[Movement]] {
    var workout = [String:[Movement]]()
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
  
  func getMovementFromValue(index:Int) -> Movement {
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

  func getTodayKey() -> String {
    let today = NSDate()
    let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
    let components = calendar.components(NSCalendarUnit.Weekday, fromDate: today)
    
    switch components.weekday {
    case 1:
      return Days.Sunday
    case 2:
      return Days.Monday
    case 3:
      return Days.Tuesday
    case 4:
      return Days.Wednesday
    case 5:
      return Days.Thursday;
    case 6:
      return Days.Friday
    case 7:
      return Days.Saturday
    default:
      return ""
    }
  }

  func convictWorkout(workoutName name:String) -> [String:[Movement]] {
    if name == Workouts.NewBlood {
      return newBloodWorkout()
    }else if name == Workouts.GoodBehavior {
      return goodBehaviorWorkout()
    }else if name == Workouts.Veterano {
      return veteranoWorkout()
    }else if name == Workouts.Solitary {
      return solitaryConfinementWorkout()
    }else if name == Workouts.Supermax {
      return supermaxWorkout()
    }else{
      return [String:[Movement]]()
    }
  }
  
  func newBloodWorkout() ->[String:[Movement]] {
    var workout = [String:[Movement]]()
    
    workout[Days.Monday]    = [Pushup(), LegRaise()]
    workout[Days.Tuesday]   = [Rest()]
    workout[Days.Wednesday] = [Rest()]
    workout[Days.Thursday]  = [Rest()]
    workout[Days.Friday]    = [Pullup(), Squat()]
    workout[Days.Saturday]  = [Rest()]
    workout[Days.Sunday]    = [Rest()]

    return workout
  }

  func goodBehaviorWorkout() ->[String:[Movement]] {
    var workout = [String:[Movement]]()

    workout[Days.Monday]    = [Pushup(), LegRaise()]
    workout[Days.Tuesday]   = [Rest()]
    workout[Days.Wednesday] = [Pullup(), Squat()]
    workout[Days.Thursday]  = [Rest()]
    workout[Days.Friday]    = [Handstand(), Bridge()]
    workout[Days.Saturday]  = [Rest()]
    workout[Days.Sunday]    = [Rest()]
    
    return workout
  }

  func veteranoWorkout() ->[String:[Movement]] {
    var workout = [String:[Movement]]()
    
    workout[Days.Monday]    = [Pullup()]
    workout[Days.Tuesday]   = [Bridge()]
    workout[Days.Wednesday] = [Handstand()]
    workout[Days.Thursday]  = [LegRaise()]
    workout[Days.Friday]    = [Squat()]
    workout[Days.Saturday]  = [Pushup()]
    workout[Days.Sunday]    = [Rest()]

    return workout
  }

  func solitaryConfinementWorkout() ->[String:[Movement]] {
    var workout = [String:[Movement]]()
    
    workout[Days.Monday]    = [Pullup(), Squat()]
    workout[Days.Tuesday]   = [Pushup(), LegRaise()]
    workout[Days.Wednesday] = [Handstand(), Bridge()]
    workout[Days.Thursday]  = [Pullup(), Squat()]
    workout[Days.Friday]    = [Pushup(), LegRaise()]
    workout[Days.Saturday]  = [Handstand(), Bridge()]
    workout[Days.Sunday]    = [Rest()]

    return workout
  }

  func supermaxWorkout() ->[String:[Movement]] {
    var workout = [String:[Movement]]()
    
    workout[Days.Monday]    = [Pullup(), Squat()]
    workout[Days.Tuesday]   = [Pushup(), LegRaise()]
    workout[Days.Wednesday] = [Handstand(), Bridge()]
    workout[Days.Thursday]  = [Pullup(), Squat()]
    workout[Days.Friday]    = [Pushup(), LegRaise()]
    workout[Days.Saturday]  = [Handstand(), Bridge()]
    workout[Days.Sunday]    = [Rest()]

    return workout
  }

  
}