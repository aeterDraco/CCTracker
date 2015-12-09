//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

class MenuModuleWireFrame: MenuModuleWireFrameProtocol
{
  class func presentMenuModuleModuleOnWindow(appWindow: UIWindow)
    {
        // Generating module components
        var view: MenuModuleViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Menu) as! MenuModuleViewProtocol
        var presenter: protocol<MenuModulePresenterProtocol, MenuModuleInteractorOutputProtocol> = MenuModulePresenter()
        var interactor: MenuModuleInteractorInputProtocol = MenuModuleInteractor()
        var localDataManager: MenuModuleLocalDataManagerInputProtocol = MenuModuleLocalDataManager()
        var wireFrame: MenuModuleWireFrameProtocol = MenuModuleWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.localDatamanager = localDataManager
      
      AppRouter.sharedInstance.installMenuViewControllerInWindow(view as! MenuModuleView, window: appWindow)
    }
  
  class func initializeModule() -> MenuModuleView {
    // Generating module components
    let view: MenuModuleViewProtocol = AppRouter.sharedInstance.instantiateViewController(ViewId.Menu) as! MenuModuleViewProtocol
    let presenter: protocol<MenuModulePresenterProtocol, MenuModuleInteractorOutputProtocol> = MenuModulePresenter()
    let interactor: MenuModuleInteractorInputProtocol = MenuModuleInteractor()
    let localDataManager: MenuModuleLocalDataManagerInputProtocol = MenuModuleLocalDataManager()
    let wireFrame: MenuModuleWireFrameProtocol = MenuModuleWireFrame()
    
    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.localDatamanager = localDataManager
  
    return view as! MenuModuleView
  }
  
  func changeViewController(menu: String, slideMenu: SlideMenuController) {
    let menuId = self.convertViewIdToMenu(menu)
    let newViewController = AppRouter.sharedInstance.fetchViewControllerWithDelegate(menuId, leftMenuProtocol: slideMenu as! LeftMenuProtocol)
    slideMenu.changeMainViewController(newViewController, close: true)
  }
  
  func convertViewIdToMenu(menu: String) -> LeftMenu {
    if menu == ViewId.Home {
      return LeftMenu.Home
    }else if menu == ViewId.Schedule {
      return LeftMenu.Schedule
    }else if menu == ViewId.Exercise {
      return LeftMenu.Exercise
    }else if menu == ViewId.Progression {
      return LeftMenu.Progression
    }else if menu == ViewId.Settings {
      return LeftMenu.Settings
    }
    return LeftMenu.Home
  }

  
}