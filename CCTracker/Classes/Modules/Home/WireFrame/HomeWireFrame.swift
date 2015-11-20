//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

import Foundation

class HomeWireFrame: HomeWireFrameProtocol
{
    class func presentHomeModule(fromView view: AnyObject)
    {
        // Generating module components
        var view: HomeViewProtocol = HomeView()
        var presenter: protocol<HomePresenterProtocol, HomeInteractorOutputProtocol> = HomePresenter()
        var interactor: HomeInteractorInputProtocol = HomeInteractor()
        var APIDataManager: HomeAPIDataManagerInputProtocol = HomeAPIDataManager()
        var localDataManager: HomeLocalDataManagerInputProtocol = HomeLocalDataManager()
        var wireFrame: HomeWireFrameProtocol = HomeWireFrame()
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.APIDataManager = APIDataManager
        interactor.localDatamanager = localDataManager
    }
}