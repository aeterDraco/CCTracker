//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeProtocols.h"


@interface HomeInteractor : NSObject <HomeInteractorInputProtocol>

@property (nonatomic, weak) id <HomeInteractorOutputProtocol> presenter;
@property (nonatomic, strong) id <HomeAPIDataManagerInputProtocol> APIDataManager;
@property (nonatomic, strong) id <HomeLocalDataManagerInputProtocol> localDataManager;

@end