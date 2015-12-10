//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

protocol ScheduleViewProtocol: class, ViewProtocol
{
  var presenter: SchedulePresenterProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> VIEW
  */
  
  func updateCCWorkoutsPicker(workoutNames: [String])
  func updateScheduleView(currentWorkoutSchedule: [Days: [Movement]])
  func updateWorkoutName(currentWorkoutName: String)
  func updateCCWorkoutSelected(isCCWorkout: Bool)
  func displayFailureSavingWorkout()
  func displaySuccessSavingWorkout()
}

protocol ScheduleWireFrameProtocol: class, MenuProtocol
{
  static func presentScheduleModule(fromView view: AnyObject)
  /**
  * Add here your methods for communication PRESENTER -> WIREFRAME
  */

  weak var delegate: LeftMenuProtocol? { get set }
}

protocol SchedulePresenterProtocol: class
{
  var view: ScheduleViewProtocol? { get set }
  var interactor: ScheduleInteractorInputProtocol? { get set }
  var wireFrame: ScheduleWireFrameProtocol? { get set }
  /**
  * Add here your methods for communication VIEW -> PRESENTER
  */
  
  func updateView()
  func fetchCCWorkoutWithName(workoutName: String)
  func saveWorkout(workoutSchedule: Set<Int>, workoutName: String, isCCWorkout: Bool)
}

protocol ScheduleInteractorOutputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> PRESENTER
  */

  func convictConditioningWorkoutNames(workoutNames: [String])
  func currentWorkout(currentWorkout: Training)
  func workoutSaveSuccesfull()
  func workoutSaveFailed()
//  func ccSelectedWorkout(selectedWorkout: Training) for now functionality is the same as currentWorkout
}

protocol ScheduleInteractorInputProtocol: class
{
  var presenter: ScheduleInteractorOutputProtocol? { get set }
  var APIDataManager: ScheduleAPIDataManagerInputProtocol? { get set }
  var localDatamanager: ScheduleLocalDataManagerInputProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> INTERACTOR
  */
  
  func fetchConvictConditioningWorkoutNames(completionHandler: CompletionHandlerType)
  func fetchCurrentWorkout()
  func fetchCCWorkoutWithName(workoutName: String)
  func saveWorkout(workoutSchedule: Set<Int>, workoutName: String, isCCWorkout: Bool)
}

protocol ScheduleDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> DATAMANAGER
  */
  
  func fetchConvictConditioningWorkoutNames()
  func fetchCCWorkoutWithName(workoutName: String)
}

protocol ScheduleAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol ScheduleLocalDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
  */

  func fetchConvictConditioningWorkoutNames(completionHandler: CompletionHandlerType)
  func fetchCurrentWorkout(completionHandler: CompletionHandlerType)
  func fetchCCWorkoutWithName(workoutName: String, completionHandler: CompletionHandlerType)
  func saveWorkout(trainingToSave: Training, completionHandler: CompletionHandlerType)
  
}
