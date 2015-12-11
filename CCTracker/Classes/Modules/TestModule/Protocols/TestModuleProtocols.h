//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TestModuleInteractorOutputProtocol;
@protocol TestModuleInteractorInputProtocol;
@protocol TestModuleViewProtocol;
@protocol TestModulePresenterProtocol;
@protocol TestModuleLocalDataManagerInputProtocol;
@protocol TestModuleAPIDataManagerInputProtocol;


@class TestModuleWireFrame;

@protocol TestModuleViewProtocol
@required
@property (nonatomic, strong) id <TestModulePresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol TestModuleWireFrameProtocol
@required
+ (void)presentTestModuleModuleFrom:(id)fromView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol TestModulePresenterProtocol
@required
@property (nonatomic, weak) id <TestModuleViewProtocol> view;
@property (nonatomic, strong) id <TestModuleInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <TestModuleWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@end

@protocol TestModuleInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol TestModuleInteractorInputProtocol
@required
@property (nonatomic, weak) id <TestModuleInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <TestModuleAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <TestModuleLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol TestModuleDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol TestModuleAPIDataManagerInputProtocol <TestModuleDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol TestModuleLocalDataManagerInputProtocol <TestModuleDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end


