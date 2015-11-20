//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol HomeInteractorOutputProtocol;
@protocol HomeInteractorInputProtocol;
@protocol HomeViewProtocol;
@protocol HomePresenterProtocol;
@protocol HomeLocalDataManagerInputProtocol;
@protocol HomeAPIDataManagerInputProtocol;


@class HomeWireFrame;

@protocol HomeViewProtocol
@required
@property (nonatomic, strong) id <HomePresenterProtocol> presenter;
/**
 * Add here your methods for communication PRESENTER -> VIEWCONTROLLER
 */
@end

@protocol HomeWireFrameProtocol
@required
+ (void)presentHomeModuleFrom:(id)fromView;
/**
 * Add here your methods for communication PRESENTER -> WIREFRAME
 */
@end

@protocol HomePresenterProtocol
@required
@property (nonatomic, weak) id <HomeViewProtocol> view;
@property (nonatomic, strong) id <HomeInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <HomeWireFrameProtocol> wireFrame;
/**
 * Add here your methods for communication VIEWCONTROLLER -> PRESENTER
 */
@end

@protocol HomeInteractorOutputProtocol
/**
 * Add here your methods for communication INTERACTOR -> PRESENTER
 */
@end

@protocol HomeInteractorInputProtocol
@required
@property (nonatomic, weak) id <HomeInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <HomeAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <HomeLocalDataManagerInputProtocol> localDataManager;
/**
 * Add here your methods for communication PRESENTER -> INTERACTOR
 */
@end


@protocol HomeDataManagerInputProtocol
/**
 * Add here your methods for communication INTERACTOR -> DATAMANAGER
 */
@end

@protocol HomeAPIDataManagerInputProtocol <HomeDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
 */
@end

@protocol HomeLocalDataManagerInputProtocol <HomeDataManagerInputProtocol>
/**
 * Add here your methods for communication INTERACTOR -> LOCLDATAMANAGER
 */
@end


