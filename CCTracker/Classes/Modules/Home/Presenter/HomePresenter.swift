//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomePresenter: HomePresenterProtocol, HomeInteractorOutputProtocol
{
  weak var view: HomeViewProtocol?
  var interactor: HomeInteractorInputProtocol?
  var wireFrame: HomeWireFrameProtocol?
    
  init() {}
  
  func updateView() {
    self.interactor?.retrieveTodaysTraining()
  }
  
  func navigateToView(viewId: LeftMenu) {
    self.wireFrame?.navigateToView(viewId)
  }
  
  func todaysTraininginfo(todaysTraining: [Movement]) {
    view!.displayTrainingInfo(todaysTraining)
  }
  
  func failedToRetrieveTodaysTraining() {
    view!.noWorkoutSelected()
  }
}