//
//  ExerciseInteractor.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class ExerciseInteractor: ExerciseInteractorInputProtocol {
  var presenter: ExerciseInteractorOutputProtocol?
  var dataManager: ExerciseLocalDataManagerInputProtocol?
  
  init(){}
  
  func fetchCurrentSteps(completionHandler: CompletionHandlerType) {
    self.dataManager!.fetchCurrentSteps{ (result) -> Void in
      switch(result) {
      case .Success(let currentSteps as [String:Int]):
        self.presenter!.didFetchCurrentSteps(currentSteps)
        completionHandler(Result.Success(""))
      default:
        break
      }
    }
  }
  
  func fetchTodaysTraining(completionHandler: CompletionHandlerType) {
    let weekDay = DateManager.obtainTodaysWeekDay()
    self.dataManager!.fetchTrainingInfoForDay(weekDay) {
      (result) -> Void in
      switch (result) {
      case .Success(let todaysTraining):
        if let unwrappedTodaysTraining = todaysTraining {
          self.presenter!.didFetchfetchTodaysTraining(unwrappedTodaysTraining as! [Movement])
        }
        completionHandler(Result.Success(""))
        break;
      case .Failure( _):
        self.presenter!.failedFetchingTodaysTraining()
        completionHandler(Result.Success(""))
        break;
      }
    }
  }
  
  func fetchAllExercises(completionHandler: CompletionHandlerType) {
    self.dataManager!.fetchAllExercises() { (result) -> Void in
      switch (result) {
        case .Success(let exercisesList as [Movement]):
          completionHandler(Result.Success(""))
          self.presenter!.didFetchAllExercises(exercisesList)
        default:
          break
      }
    }
  }

}