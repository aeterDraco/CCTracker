//
//  ExerciseLocalDataManager.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class ExerciseLocalDataManager: ExerciseLocalDataManagerInputProtocol {

  let dataManager = DataManager()
  
  init(){}

  func fetchCurrentSteps(completionHandler: CompletionHandlerType) {
    dataManager.fetchCurrentExercisesInfo{ (result) -> Void in
      switch (result) {
      case .Success(let currentSteps as [String:Int]):
        completionHandler(Result.Success(currentSteps))
      default:
        break
      }
    }
  }
  
  func fetchTrainingInfoForDay(dayOfTheWeek: Days, completionHandler: CompletionHandlerType){
    dataManager.fetchCurrentWorkout{ (result) -> Void in
      switch (result) {
      case .Success(let currentTraining as Training):
        completionHandler(Result.Success(currentTraining.schedule[dayOfTheWeek]))
        break
      case .Failure(let error):
        completionHandler(Result.Failure(error))
      default:
        break
      }
    }
  }
  
  func fetchAllExercises(completionHandler: CompletionHandlerType) {
    let exerciseList = dataManager.fetchAllExercises()
    completionHandler(Result.Success(exerciseList))
  }

}