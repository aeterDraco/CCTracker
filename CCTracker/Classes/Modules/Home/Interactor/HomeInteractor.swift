//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol
{
  weak var presenter: HomeInteractorOutputProtocol?
  var APIDataManager: HomeAPIDataManagerInputProtocol?
  var localDatamanager: HomeLocalDataManagerInputProtocol?
    
  init() {}
  
  func retrieveTodaysTraining() {
    let weekDay = DateManager.obtainTodaysWeekDay()
    self.localDatamanager?.trainingInfoForDay(dayOfTheWeek: weekDay) {
      (result) -> Void in
      switch (result) {
        case .Success(let todaysTraining):
          if let unwrappedTodaysTraining = todaysTraining {
            self.presenter?.todaysTraininginfo(unwrappedTodaysTraining as! [Movement])
          }
          break;
        case .Failure( _):
          self.presenter?.failedToRetrieveTodaysTraining()
          break;
      }
    }
  }

}