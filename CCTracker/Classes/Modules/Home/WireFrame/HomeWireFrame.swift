//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class HomeWireFrame: HomeWireFrameProtocol
{

  weak var delegate: LeftMenuProtocol?
  
  class func presentHomeModule(fromView view: AnyObject) {
    
  }
  
  class func presentHomeModuleOnWindow(window: UIWindow)  {
    // Generating module components
    let view: HomeViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Home) as! HomeViewProtocol
    let presenter: protocol<HomePresenterProtocol, HomeInteractorOutputProtocol> = HomePresenter()
    let interactor: HomeInteractorInputProtocol = HomeInteractor()
    let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
    let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
    
//    AppRouter.sharedInstance.installRootViewControllerInWindow(view, window: window)
  }
  
  class func initializeModule() -> HomeView {
    // Generating module components
    let view: HomeViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Home) as! HomeViewProtocol
    let presenter: protocol<HomePresenterProtocol, HomeInteractorOutputProtocol> = HomePresenter()
    let interactor: HomeInteractorInputProtocol = HomeInteractor()
    let localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
    let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
    
    return view as! HomeView
  }
  
  class func initializeModule(leftMenuProtocol: LeftMenuProtocol) -> HomeView {
    // Generating module components
    var view: HomeViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Home) as! HomeViewProtocol
    var presenter: protocol<HomePresenterProtocol, HomeInteractorOutputProtocol> = HomePresenter()
    var interactor: HomeInteractorInputProtocol = HomeInteractor()
    var localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
    var wireFrame: HomeWireFrameProtocol = HomeWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
    
    wireFrame.delegate = leftMenuProtocol
  
    return view as! HomeView
  }
  
  func navigateToView(viewId: LeftMenu) {
    self.delegate?.changeViewController(viewId)
  }

}