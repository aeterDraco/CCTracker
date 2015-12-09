//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class ScheduleWireFrame: ScheduleWireFrameProtocol
{
  
  weak var delegate: LeftMenuProtocol?
  
  class func presentScheduleModule(fromView view: AnyObject)  {
      // Generating module components
      var view: ScheduleViewProtocol = ScheduleView()
      var presenter: protocol<SchedulePresenterProtocol, ScheduleInteractorOutputProtocol> = SchedulePresenter()
      var interactor: ScheduleInteractorInputProtocol = ScheduleInteractor()
//      var APIDataManager: ScheduleAPIDataManagerInputProtocol = ScheduleAPIDataManager()
      var localDataManager: ScheduleLocalDataManagerInputProtocol = ScheduleLocalDataManager()
      var wireFrame: ScheduleWireFrameProtocol = ScheduleWireFrame()
        
      // Connecting
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      interactor.presenter = presenter
//      interactor.APIDataManager = APIDataManager
      interactor.localDatamanager = localDataManager
  }
  
  class func presentScheduleModule()  {
    // Generating module components
    var view: ScheduleViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Schedule) as! ScheduleViewProtocol
    var presenter: protocol<SchedulePresenterProtocol, ScheduleInteractorOutputProtocol> = SchedulePresenter()
    var interactor: ScheduleInteractorInputProtocol = ScheduleInteractor()
    //      var APIDataManager: ScheduleAPIDataManagerInputProtocol = ScheduleAPIDataManager()
    var localDataManager: ScheduleLocalDataManagerInputProtocol = ScheduleLocalDataManager()
    var wireFrame: ScheduleWireFrameProtocol = ScheduleWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    //      interactor.APIDataManager = APIDataManager
    interactor.localDatamanager = localDataManager
    
//    AppRouter.sharedInstance.installViewController(view)
  }
  
  class func initializeModule(leftMenuProtocol: LeftMenuProtocol) -> ScheduleView {
    // Generating module components
    var view: ScheduleViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Schedule) as! ScheduleViewProtocol
    var presenter: protocol<SchedulePresenterProtocol, ScheduleInteractorOutputProtocol> = SchedulePresenter()
    var interactor: ScheduleInteractorInputProtocol = ScheduleInteractor()
    //      var APIDataManager: ScheduleAPIDataManagerInputProtocol = ScheduleAPIDataManager()
    var localDataManager: ScheduleLocalDataManagerInputProtocol = ScheduleLocalDataManager()
    var wireFrame: ScheduleWireFrameProtocol = ScheduleWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    //      interactor.APIDataManager = APIDataManager
    interactor.localDatamanager = localDataManager
    
    wireFrame.delegate = leftMenuProtocol
    
    return view as! ScheduleView
  }
  
}