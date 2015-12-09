//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestModuleProtocols.h"

@class TestModuleWireFrame;

@interface TestModulePresenter : NSObject <TestModulePresenterProtocol, TestModuleInteractorOutputProtocol>

@property (nonatomic, weak) id <TestModuleViewProtocol> view;
@property (nonatomic, strong) id <TestModuleInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <TestModuleWireFrameProtocol> wireFrame;

@end
