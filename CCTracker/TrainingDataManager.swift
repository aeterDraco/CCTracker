//
//  TrainingDataManager.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 24/11/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

protocol TrainingDataManagerProtocol {
  func generateTrainingInfo() -> [String:[String]]
  func getTrainingName() -> String
  func getCCWorkoutStatus() -> Bool
}

class TrainingDataManager {
  let userDefaults = NSUserDefaults.standardUserDefaults()
  
  func fetchCCWorkoutNames() -> [String] {
    return Workout.getWorkoutNames()
  }
  
  func fetchCurrentWorkout() -> [Days:[Movement]] {
    
    return [Days:[Movement]]()
  }
  
  func saveTraining(training:TrainingDataManagerProtocol){
    let workoutToSave = training.generateTrainingInfo()
    let workoutName   = training.getTrainingName()
    let isCCWorkout   = training.getCCWorkoutStatus()
    userDefaults.setObject(workoutToSave, forKey: Defaults.schedule)
    userDefaults.setObject(workoutName, forKey: Defaults.workoutName)
    userDefaults.setBool(isCCWorkout, forKey: Defaults.isCCWorkout)
    userDefaults.synchronize()
  }
  
  func loadTraining() -> Training {
    if let trainingData = userDefaults.dictionaryForKey(Defaults.schedule) as? [String:[String]]{
      let workoutName = userDefaults.stringForKey(Defaults.workoutName)
      let isCCWorkout = userDefaults.boolForKey(Defaults.isCCWorkout)
      return Training(trainingInfo: trainingData, trainingName: workoutName!, isCCWorkout: isCCWorkout)
    }else{
      return Training()
    }
  }
}