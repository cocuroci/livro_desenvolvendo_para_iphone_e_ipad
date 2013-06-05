//
//  MyTabBarController.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/6/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "MyTabBarController.h"

@implementation MyTabBarController

/*
 
 TabBar customizada para iOS 6
 
 Permite com que o view controller atual decida a orientação
 
 */

#pragma mark - rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Delega para o View Controller atual
    return [self.selectedViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Delega para o View Controller atual
    return [self.selectedViewController supportedInterfaceOrientations];
}

@end
