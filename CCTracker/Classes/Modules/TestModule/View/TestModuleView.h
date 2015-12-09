//
// Created by VIPER
// Copyright (c) 2015 VIPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModuleProtocols.h"

@interface TestModuleView : UIViewController <TestModuleViewProtocol>

@property (nonatomic, strong) id <TestModulePresenterProtocol> presenter;

@end
