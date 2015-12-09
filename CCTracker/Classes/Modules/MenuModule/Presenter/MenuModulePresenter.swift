//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MenuModulePresenter: MenuModulePresenterProtocol, MenuModuleInteractorOutputProtocol
{
    weak var view: MenuModuleViewProtocol?
    var interactor: MenuModuleInteractorInputProtocol?
    var wireFrame: MenuModuleWireFrameProtocol?
    
    init() {}
  
  func numberOfMenuItems() -> Int {
    return self.interactor!.getMenuItems().count
  }
  
  func getMenuItem(tableRow: Int) -> String {
    return self.interactor!.getMenuItems()[tableRow] as! String
  }
  
  func changeViewController(menu: String, slideMenu: SlideMenuController) {
    self.wireFrame!.changeViewController(menu, slideMenu: slideMenu)
  }

}