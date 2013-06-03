//
//  MyTabBarController.m
//  Carros
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()

@end

@implementation MyTabBarController

#pragma mark - rotation iOS 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - rotation iOS 6
-(NSUInteger)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
