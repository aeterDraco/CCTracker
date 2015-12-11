//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class SchedulePresenter: SchedulePresenterProtocol, ScheduleInteractorOutputProtocol
{
  weak var view: ScheduleViewProtocol?
  var interactor: ScheduleInteractorInputProtocol?
  var wireFrame: ScheduleWireFrameProtocol?
    
  init() {}
  
  //MARK: - ScheduleInteractorInputProtocol
  func updateView() {
    self.interactor?.fetchConvictConditioningWorkoutNames(){ (result) -> Void in
      switch (result) {
        case Result.Success( _ as String):
          self.interactor?.fetchCurrentWorkout()
        default:
          break
      }
    }
  }
  
  func fetchCCWorkoutWithName(workoutName: String) {
      self.interactor!.fetchCCWorkoutWithName(workoutName)
  }
  
  func saveWorkout(workoutSchedule: Set<Int>, workoutName: String, isCCWorkout: Bool) {
    self.interactor!.saveWorkout(workoutSchedule, workoutName: workoutName, isCCWorkout: isCCWorkout)
  }


  //MARK: - ScheduleInteractorOutputProtocol
  func convictConditioningWorkoutNames(workoutNames: [String]) {
    self.view!.updateCCWorkoutsPicker(workoutNames)
  }
 
  func currentWorkout(currentWorkout: Training) {
    self.view!.clearScheduleView() { (result) -> Void in
      self.view!.updateScheduleView(currentWorkout.schedule)
      self.view!.updateWorkoutName(currentWorkout.name)
      self.view!.updateCCWorkoutSelected(currentWorkout.isCCWorkout)
    }
  }
  
  func workoutSaveSuccesfull() {
    self.view!.displaySuccessSavingWorkout()
  }
  
  func workoutSaveFailed() {
    self.view!.displayFailureSavingWorkout()
  }

}