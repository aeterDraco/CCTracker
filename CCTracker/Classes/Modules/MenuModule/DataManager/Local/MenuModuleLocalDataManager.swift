//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class MenuModuleLocalDataManager: MenuModuleLocalDataManagerInputProtocol
{
  init() {}
  
  let menuItems = ["Home", "Schedule", "Exercise", "Progression", "Settings"]
  
  
  func getMenuItems() -> NSArray {
    return menuItems
  }
}