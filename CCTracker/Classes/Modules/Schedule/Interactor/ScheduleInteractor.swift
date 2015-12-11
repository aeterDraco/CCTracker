//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class ScheduleInteractor: ScheduleInteractorInputProtocol
{
    weak var presenter: ScheduleInteractorOutputProtocol?
    var APIDataManager: ScheduleAPIDataManagerInputProtocol?
    var localDatamanager: ScheduleLocalDataManagerInputProtocol?
    
    init() {}
  
  //MARK: - ScheduleLocalDataManagerInputProtocol
  func fetchConvictConditioningWorkoutNames(completionHandler: CompletionHandlerType) {
    self.localDatamanager!.fetchConvictConditioningWorkoutNames{ (result) -> Void in
      switch(result) {
        case .Success(let ccWorkoutNames as [String]):
          self.presenter?.convictConditioningWorkoutNames(ccWorkoutNames)
          completionHandler(Result.Success("Success"))
        default:
          break
      }
    }
  }
  
  func fetchCurrentWorkout() {
    self.localDatamanager!.fetchCurrentWorkout{ (result) -> Void in
      switch(result) {
        case .Success(let currentWorkout as Training):
          self.presenter?.currentWorkout(currentWorkout)
        default:
          break
      }
    }
  }
  
  func fetchCCWorkoutWithName(workoutName: String) {
    self.localDatamanager!.fetchCCWorkoutWithName(workoutName) { (result) -> Void in
      switch (result) {
        case .Success(let ccWorkout as Training):
          self.presenter?.currentWorkout(ccWorkout)
        default:
          break
      }
    }
  }
  
  func saveWorkout(workoutSchedule: Set<Int>, workoutName: String, isCCWorkout: Bool) {
    let schedule = Training.createWorkoutWithSet(workoutSchedule)
    let trainingToSave = Training.init(trainingSchedule: schedule, trainingName: workoutName, isCCWorkout: isCCWorkout)
    self.localDatamanager!.saveWorkout(trainingToSave) { (result) -> Void in
      switch (result) {
      case .Success(_):
        self.presenter!.workoutSaveSuccesfull()
      case .Failure(_):
        self.presenter!.workoutSaveFailed()
      }
    }
  }

}