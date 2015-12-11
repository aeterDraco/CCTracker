//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MenuModuleInteractor: MenuModuleInteractorInputProtocol
{
    weak var presenter: MenuModuleInteractorOutputProtocol?
    var APIDataManager: MenuModuleAPIDataManagerInputProtocol?
    var localDatamanager: MenuModuleLocalDataManagerInputProtocol?
  
  
    init() {
    }
  
  func getMenuItems() -> NSArray {
    return (localDatamanager?.getMenuItems())!
  }

}