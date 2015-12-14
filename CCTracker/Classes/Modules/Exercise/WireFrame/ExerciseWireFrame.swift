//
//  ExerciseWireFrame.swift
//  CCTracker
//
//  Created by Ricardo Quintero on 11/12/15.
//  Copyright © 2015 Arteries Studio. All rights reserved.
//

import Foundation
import UIKit

class ExerciseWireFrame: ExerciseWireFrameProtocol {
  
  weak var delegate: LeftMenuProtocol?
  
  class func initializeModule(leftMenuProtocol: LeftMenuProtocol) -> ExerciseView {
    var view: ExerciseViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Exercise) as! ExerciseViewProtocol
    var presenter: protocol<ExercisePresenterProtocol, ExerciseInteractorOutputProtocol> = ExercisePresenter()
    var interactor: ExerciseInteractorInputProtocol = ExerciseInteractor()
    var localDataManager: ExerciseLocalDataManagerInputProtocol = ExerciseLocalDataManager()
    var wireFrame: ExerciseWireFrameProtocol = ExerciseWireFrame()
    
    //Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.interactor = interactor
    presenter.wireFrame = wireFrame
    interactor.presenter = presenter
    interactor.localDataManager = localDataManager
    
    wireFrame.delegate = leftMenuProtocol
    
    return view as! ExerciseView
  }
  
}