//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestModuleProtocols.h"


@interface TestModuleInteractor : NSObject <TestModuleInteractorInputProtocol>

@property (nonatomic, weak) id <TestModuleInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <TestModuleAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <TestModuleLocalDataManagerInputProtocol> localDataManager;

@end