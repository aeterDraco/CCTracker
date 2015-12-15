//
//  ExerciseProtocol.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

protocol ExerciseViewProtocol: class {
  var presenter: ExercisePresenterProtocol? { get set }

  // PRESENTER -> VIEW
  func updateCurrentStepsInfo(currentSteps: [String: Int])
  func updateExerciseLists(exerciseList: [Movement])
  func reloadExercises()
}

protocol ExerciseWireFrameProtocol: class, MenuProtocol {
//  static func presentExerciseModule(fromView view: AnyObject)

  // PRESENTER -> WIREFRAME
  
  weak var delegate: LeftMenuProtocol? {get set }
}

protocol ExercisePresenterProtocol: class {
  var view: ExerciseViewProtocol? { get set }
  var interactor: ExerciseInteractorInputProtocol? { get set }
  var wireFrame: ExerciseWireFrameProtocol? { get set }

  // VIEW -> PRESENTER
  func updateView()
}

protocol ExerciseInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func didFetchfetchTodaysTraining(todaysTraining: [Movement])
  func failedFetchingTodaysTraining()
  func didFetchCurrentSteps(currentSteps: [String:Int])
  func didFetchAllExercises(exerciseList: [Movement])
}

protocol ExerciseInteractorInputProtocol: class {
  var presenter: ExerciseInteractorOutputProtocol? { get set }
  var dataManager: ExerciseLocalDataManagerInputProtocol? { get set }
  
  // PRESENTER -> INTERACTOR
  func fetchAllExercises(completionHandler: CompletionHandlerType)
  func fetchCurrentSteps(completionHandler: CompletionHandlerType)
  func fetchTodaysTraining(completionHandler: CompletionHandlerType)
}

protocol ExerciseLocalDataManagerInputProtocol: class {
  // INTERACTOR -> DATAMANAGER
  func fetchTrainingInfoForDay(dayOfTheWeek: Days, completionHandler: CompletionHandlerType)
  func fetchCurrentSteps(completionHandler: CompletionHandlerType)
  func fetchAllExercises(completionHandler: CompletionHandlerType)
}
