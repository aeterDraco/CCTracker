//
//  WorkoutDataManager.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 27/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

protocol WorkoutDataManagerProtocol {
  static func getWorkoutNames() -> [String]
}

class WorkoutDataManager {
  
  func fetchCCWorkoutNames() -> [String] {
    return Workout.getWorkoutNames()
  }
  
  func fetchCurrentWorkout() -> [Days:[Movement]] {
    return [Days:[Movement]]()
  }
  
}