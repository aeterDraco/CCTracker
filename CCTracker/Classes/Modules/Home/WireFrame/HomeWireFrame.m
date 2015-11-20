//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import "HomeWireFrame.h"

@implementation HomeWireFrame

+ (void)presentHomeModuleFrom:(UIViewController*)fromViewController
{
    // Generating module components
    id <HomeViewProtocol> view = [[HomeView alloc] init];
    id <HomePresenterProtocol, HomeInteractorOutputProtocol> presenter = [HomePresenter new];
    id <HomeInteractorInputProtocol> interactor = [HomeInteractor new];
    id <HomeAPIDataManagerInputProtocol> APIDataManager = [HomeAPIDataManager new];
    id <HomeLocalDataManagerInputProtocol> localDataManager = [HomeLocalDataManager new];
    id <HomeWireFrameProtocol> wireFrame= [HomeWireFrame new];
    
    // Connecting
    view.presenter = presenter;
    presenter.view = view;
    presenter.wireFrame = wireFrame;
    presenter.interactor = interactor;
    interactor.presenter = presenter;
    interactor.APIDataManager = APIDataManager;
    interactor.localDataManager = localDataManager;
    
    //TOODO - New view controller presentation (present, push, pop, .. )
}

@end
