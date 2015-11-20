//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeProtocols.h"

@class HomeWireFrame;

@interface HomePresenter : NSObject <HomePresenterProtocol, HomeInteractorOutputProtocol>

@property (nonatomic, weak) id <HomeViewProtocol> view;
@property (nonatomic, strong) id <HomeInteractorInputProtocol> interactor;
@property (nonatomic, strong) id <HomeWireFrameProtocol> wireFrame;

@end
