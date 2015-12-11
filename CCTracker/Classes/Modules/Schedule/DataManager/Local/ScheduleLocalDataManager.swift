//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class ScheduleLocalDataManager: ScheduleLocalDataManagerInputProtocol
{
  
  let dataManager = DataManager()
  
  init() {}
  
  func fetchConvictConditioningWorkoutNames(completionHandler: CompletionHandlerType) {
    dataManager.fetchConvictConditioningWorkoutNames{ (result) -> Void in
      switch (result) {
      case .Success(let ccWorkoutNames as [String]):
          completionHandler(Result.Success(ccWorkoutNames))
        case .Failure(let error):
          completionHandler(Result.Failure(error))
        default:
          break
      }
    }
  }

  func fetchCurrentWorkout(completionHandler: CompletionHandlerType) {
    dataManager.fetchCurrentWorkout{ (result) -> Void in
      switch (result) {
        case .Success(let currentWorkout as Training):
          completionHandler(Result.Success(currentWorkout))
        case .Failure(let error):
          completionHandler(Result.Failure(error))
        default:
          break
      }
    }
  }
  
  func fetchCCWorkoutWithName(workoutName: String, completionHandler: CompletionHandlerType) {
    dataManager.fetchCCworkoutWithName(workoutName){ (result) -> Void in
      switch (result) {
        case .Success(let selectedTraining as Training):
          completionHandler(Result.Success(selectedTraining))
        case .Failure(let error):
          completionHandler(Result.Failure(error))
        default:
          break
      }
    }
  }
  
  func saveWorkout(trainingToSave: Training, completionHandler: CompletionHandlerType) {
    dataManager.saveTraining(trainingToSave) { (result) -> Void in
      switch (result) {
      case .Success(_):
        completionHandler(Result.Success(true))
      case .Failure(_):
        completionHandler(Result.Failure(.LocalDataManagerFailure))
      }
    }
  }

}