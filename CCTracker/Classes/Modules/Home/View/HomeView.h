//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeProtocols.h"

@interface HomeView : UIViewController <HomeViewProtocol>

@property (nonatomic, strong) id <HomePresenterProtocol> presenter;

@end
