//
//  MyNavigationController.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/6/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "MyNavigationController.h"

@implementation MyNavigationController

/*
 
 Navigation Controller customizado para iOS 6
 
 Permite com que o view controller atual decida a orientação
 
 */

#pragma mark - rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Delega para o View Controller atual (é o último do array)
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Delega para o View Controller atual (é o último do array)
    return [self.topViewController supportedInterfaceOrientations];
}

@end
