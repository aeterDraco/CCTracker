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
  
//  func fetchConvictConditioningWorkoutNames()
  func updateView()
}

protocol ScheduleInteractorOutputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> PRESENTER
  */

  func convictConditioningWorkoutNames(workoutNames: [String])
  func currentWorkout(currentWorkout: Training)
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
}

protocol ScheduleDataManagerInputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> DATAMANAGER
  */
  
  func fetchConvictConditioningWorkoutNames()
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
}
