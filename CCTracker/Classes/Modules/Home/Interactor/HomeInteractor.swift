//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInputProtocol
{
    weak var presenter: HomeInteractorOutputProtocol?
    var APIDataManager: HomeAPIDataManagerInputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    
    init() {}
}