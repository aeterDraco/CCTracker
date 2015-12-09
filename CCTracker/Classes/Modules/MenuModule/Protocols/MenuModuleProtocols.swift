//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation
import UIKit

protocol MenuModuleViewProtocol: class, ViewProtocol
{
    var presenter: MenuModulePresenterProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> VIEW
    */
}

protocol MenuModuleWireFrameProtocol: class
{
    static func presentMenuModuleModuleOnWindow(appWindow: UIWindow)
    /**
    * Add here your methods for communication PRESENTER -> WIREFRAME
    */
  func changeViewController(menu: String, slideMenu: SlideMenuController)
}

protocol MenuModulePresenterProtocol: class
{
    var view: MenuModuleViewProtocol? { get set }
    var interactor: MenuModuleInteractorInputProtocol? { get set }
    var wireFrame: MenuModuleWireFrameProtocol? { get set }
    /**
    * Add here your methods for communication VIEW -> PRESENTER
    */
  func numberOfMenuItems() -> Int
  func getMenuItem(_: Int) -> String

  func changeViewController(menu: String, slideMenu: SlideMenuController)
}

protocol MenuModuleInteractorOutputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
}

protocol MenuModuleInteractorInputProtocol: class
{
    var presenter: MenuModuleInteractorOutputProtocol? { get set }
    var APIDataManager: MenuModuleAPIDataManagerInputProtocol? { get set }
    var localDatamanager: MenuModuleLocalDataManagerInputProtocol? { get set }
    /**
    * Add here your methods for communication PRESENTER -> INTERACTOR
    */
  func getMenuItems() -> NSArray
}

protocol MenuModuleDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> DATAMANAGER
    */
}

protocol MenuModuleAPIDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
    */
}

protocol MenuModuleLocalDataManagerInputProtocol: class
{
    /**
    * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
    */
  func getMenuItems() -> NSArray
}
