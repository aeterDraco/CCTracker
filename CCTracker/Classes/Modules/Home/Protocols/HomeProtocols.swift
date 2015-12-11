//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

protocol HomeViewProtocol: class, ViewProtocol
{
  var presenter: HomePresenterProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> VIEW
  */
  
  func displayTrainingInfo(todaysTraining: [Movement])
  func noWorkoutSelected()
}

protocol HomeWireFrameProtocol: class, MenuProtocol
{
  static func presentHomeModule(fromView view: AnyObject)
  /**
  * Add here your methods for communication PRESENTER -> WIREFRAME
  */

  weak var delegate: LeftMenuProtocol? { get set }

  func navigateToView(viewId: LeftMenu)

}

protocol HomePresenterProtocol: class
{
  var view: HomeViewProtocol? { get set }
  var interactor: HomeInteractorInputProtocol? { get set }
  var wireFrame: HomeWireFrameProtocol? { get set }
  /**
  * Add here your methods for communication VIEW -> PRESENTER
  */
  
  func updateView()
  func navigateToView(viewId: LeftMenu)
}

protocol HomeInteractorOutputProtocol: class
{
  /**
  * Add here your methods for communication INTERACTOR -> PRESENTER
  */
  
  func todaysTraininginfo(todaysTraining: [Movement])
  func failedToRetrieveTodaysTraining()
}

protocol HomeInteractorInputProtocol: class
{
  var presenter: HomeInteractorOutputProtocol? { get set }
  var APIDataManager: HomeAPIDataManagerInputProtocol? { get set }
  var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
  /**
  * Add here your methods for communication PRESENTER -> INTERACTOR
  */
  
  func retrieveTodaysTraining()
}

protocol HomeDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol HomeAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol HomeLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
  
  func trainingInfoForDay(dayOfTheWeek day:Days, completionHandler: CompletionHandlerType)
}
