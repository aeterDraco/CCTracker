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
  
  func fetchCurrentSteps() {
    self.dataManager!.fetchCurrentSteps{ (result) -> Void in
      switch(result) {
      case .Success(let currentSteps as [String:Int]):
        self.presenter!.didFetchCurrentSteps(currentSteps)
      default:
        break
      }
    }
  }
  
  func fetchTodaysTraining() {
    let weekDay = DateManager.obtainTodaysWeekDay()
    self.dataManager!.fetchTrainingInfoForDay(weekDay) {
      (result) -> Void in
      switch (result) {
      case .Success(let todaysTraining):
        if let unwrappedTodaysTraining = todaysTraining {
          self.presenter!.didFetchfetchTodaysTraining(unwrappedTodaysTraining as! [Movement])
        }
        break;
      case .Failure( _):
        self.presenter!.failedFetchingTodaysTraining()
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