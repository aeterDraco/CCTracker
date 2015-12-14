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
      self.interactor!.fetchCurrentSteps() //retrieves the Current steps of the exercises
      self.interactor!.fetchTodaysTraining() //retrieves the Exercises available for today
    }
  }
 
  //MARK: - ExerciseInteractorOutputProtocol Methods
  func didFetchfetchTodaysTraining(todaysTraining: [Movement]) {
    
  }
  
  func failedFetchingTodaysTraining() {
    
  }
  
  func didFetchCurrentSteps(currentSteps: [String:Int]) {
  
  }
  
  func didFetchAllExercises(exerciseList: [Movment]) {
    
  }

}