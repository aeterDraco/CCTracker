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
  
  func fetchWorkoutWithName(workoutName: String) -> Training {
    let ccSchedule = Workout.convictWorkout(name: workoutName)
    let selectedTraining = Training.init(trainingSchedule: ccSchedule, trainingName: workoutName, isCCWorkout: true)
    return selectedTraining
  }
  
  func saveTraining(training:TrainingDataManagerProtocol, completionHandler: CompletionHandlerType){
    let workoutToSave = training.generateTrainingInfo()
    let workoutName   = training.getTrainingName()
    let isCCWorkout   = training.getCCWorkoutStatus()
    userDefaults.setObject(workoutToSave, forKey: Defaults.schedule)
    userDefaults.setObject(workoutName, forKey: Defaults.workoutName)
    userDefaults.setBool(isCCWorkout, forKey: Defaults.isCCWorkout)
    let succesfulSync = userDefaults.synchronize()
    
    if succesfulSync {
      completionHandler(Result.Success(true))
    } else {
      completionHandler(Result.Failure(.LocalDataManagerFailure))
    }
  }
  
  func loadTraining() -> Training {
    if let trainingDictionary = userDefaults.dictionaryForKey(Defaults.schedule) as? [String:[String]]{
      let workoutName = userDefaults.stringForKey(Defaults.workoutName)
      let isCCWorkout = userDefaults.boolForKey(Defaults.isCCWorkout)
      
      var trainingInfo = [Int:[String]]()
      for key in trainingDictionary.keys {
        trainingInfo[Int(key)!] = trainingDictionary[key]
      }
      
      return Training.init(trainingInfo: trainingInfo, trainingName: workoutName!, isCCWorkout: isCCWorkout)
    }else{
      return Training()
    }
  }
}