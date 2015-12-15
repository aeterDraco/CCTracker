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
    interactor!.fetchAllExercises() { (result) -> Void in
      //retrieves the Current steps of the exercises
      self.interactor!.fetchCurrentSteps()  { (result) -> Void in
        //retrieves the Exercises available for today
        self.interactor!.fetchTodaysTraining() { (result) -> Void in
          self.view!.reloadExercises()
        }
      }
    }
  }
 
  //MARK: - ExerciseInteractorOutputProtocol Methods
  func didFetchfetchTodaysTraining(todaysTraining: [Movement]) {
    
  }
  
  func failedFetchingTodaysTraining() {
    
  }
  
  func didFetchCurrentSteps(currentSteps: [String:Int]) {
    self.view!.updateCurrentStepsInfo(currentSteps)
  }
  
  func didFetchAllExercises(exerciseList: [Movement]) {
    
  }
  
}