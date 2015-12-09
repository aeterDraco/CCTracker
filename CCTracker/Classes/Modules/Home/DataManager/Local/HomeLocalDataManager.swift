//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeLocalDataManager: HomeLocalDataManagerInputProtocol
{
  
  let dataManager = DataManager()
  
  init() {}
  
  func trainingInfoForDay(dayOfTheWeek day:Days, completionHandler: CompletionHandlerType){
    
    dataManager.fetchCurrentWorkout{ (result) -> Void in
      switch (result) {
        case .Success(let currentTraining as Training):
          completionHandler(Result.Success(currentTraining.schedule[day]))
          break
        case .Failure(let error):
          completionHandler(Result.Failure(error))
        default:
          break
      }
    }
  }
}