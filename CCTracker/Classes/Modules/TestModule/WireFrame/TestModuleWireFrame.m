//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import "TestModuleWireFrame.h"

@implementation TestModuleWireFrame

+ (void)presentTestModuleModuleFrom:(UIViewController*)fromViewController
{
    // Generating module components
    id <TestModuleViewProtocol> view = [[TestModuleView alloc] init];
    id <TestModulePresenterProtocol, TestModuleInteractorOutputProtocol> presenter = [TestModulePresenter new];
    id <TestModuleInteractorInputProtocol> interactor = [TestModuleInteractor new];
    id <TestModuleAPIDataManagerInputProtocol> APIDataManager = [TestModuleAPIDataManager new];
    id <TestModuleLocalDataManagerInputProtocol> localDataManager = [TestModuleLocalDataManager new];
    id <TestModuleWireFrameProtocol> wireFrame= [TestModuleWireFrame new];
    
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
