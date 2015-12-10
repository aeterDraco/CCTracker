//
//  Workout.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 25/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class Workout: WorkoutDataManagerProtocol {
  
  static func getWorkoutNames() -> [String] {
    let names = [Workouts.NewBlood, Workouts.GoodBehavior, Workouts.Veterano, Workouts.Solitary, Workouts.Supermax];
    return names
  }
  
  static func convictWorkout(name name:String) -> [Days:[Movement]] {
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
      return [Days:[Movement]]()
    }
  }
  
  private static func newBloodWorkout() ->[Days:[Movement]] {
    var workout = [Days:[Movement]]()
    
    workout[Days.Monday]    = [Pushup(), LegRaise()]
    workout[Days.Tuesday]   = [Rest()]
    workout[Days.Wednesday] = [Rest()]
    workout[Days.Thursday]  = [Rest()]
    workout[Days.Friday]    = [Pullup(), Squat()]
    workout[Days.Saturday]  = [Rest()]
    workout[Days.Sunday]    = [Rest()]
    
    return workout
  }
  
  private static func goodBehaviorWorkout() ->[Days:[Movement]] {
    var workout = [Days:[Movement]]()
    
    workout[Days.Monday]    = [Pushup(), LegRaise()]
    workout[Days.Tuesday]   = [Rest()]
    workout[Days.Wednesday] = [Pullup(), Squat()]
    workout[Days.Thursday]  = [Rest()]
    workout[Days.Friday]    = [Handstand(), Bridge()]
    workout[Days.Saturday]  = [Rest()]
    workout[Days.Sunday]    = [Rest()]
    
    return workout
  }
  
  private static func veteranoWorkout() ->[Days:[Movement]] {
    var workout = [Days:[Movement]]()
    
    workout[Days.Monday]    = [Pullup()]
    workout[Days.Tuesday]   = [Bridge()]
    workout[Days.Wednesday] = [Handstand()]
    workout[Days.Thursday]  = [LegRaise()]
    workout[Days.Friday]    = [Squat()]
    workout[Days.Saturday]  = [Pushup()]
    workout[Days.Sunday]    = [Rest()]
    
    return workout
  }
  
  private static func solitaryConfinementWorkout() ->[Days:[Movement]] {
    var workout = [Days:[Movement]]()
    
    workout[Days.Monday]    = [Pullup(), Squat()]
    workout[Days.Tuesday]   = [Pushup(), LegRaise()]
    workout[Days.Wednesday] = [Handstand(), Bridge()]
    workout[Days.Thursday]  = [Pullup(), Squat()]
    workout[Days.Friday]    = [Pushup(), LegRaise()]
    workout[Days.Saturday]  = [Handstand(), Bridge()]
    workout[Days.Sunday]    = [Rest()]
    
    return workout
  }
  
  private static func supermaxWorkout() ->[Days:[Movement]] {
    var workout = [Days:[Movement]]()
    
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