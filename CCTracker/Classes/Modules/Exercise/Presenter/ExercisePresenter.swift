//
//  ExercisePresenter.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation

class ExercisePresenter: ExercisePresenterProtocol, ExerciseInteractorOutputProtocol {
  var view: ExerciseViewProtocol?
  var interactor: ExerciseInteractorInputProtocol?
  var wireFrame: ExerciseWireFrameProtocol?
  
  init() {}
  
  //MARK: - ExercisePresenterProtocol Methods
  func updateView() {
    interactor!.fetchAllExercises() { result in
      //retrieves the Current steps of the exercises
      self.interactor!.fetchCurrentSteps()  { result in
        //retrieves the Exercises available for today
        self.interactor!.fetchTodaysTraining() { result in
          self.view!.reloadExercises()
        }
      }
    }
  }
 
  //MARK: - ExerciseInteractorOutputProtocol Methods
  func didFetchfetchTodaysTraining(todaysTraining: [Movement]) {
    self.view!.updateTodaysTraining(todaysTraining)
  }
  
  func failedFetchingTodaysTraining() {
    self.view!.showNoTrainingSelectedAlert()
  }
  
  func didFetchCurrentSteps(currentSteps: [String:Int]) {
    self.view!.updateCurrentStepsInfo(currentSteps)
  }
  
  func didFetchAllExercises(exerciseList: [Movement]) {
    self.view!.updateExerciseLists(exerciseList)
  }
  
  func navigateToView(viewId: LeftMenu) {
    self.wireFrame?.navigateToView(viewId)
  }
  
}