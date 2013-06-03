//
//  MyNavigationController.m
//  Carros
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "MyNavigationController.h"

@interface MyNavigationController ()

@end

@implementation MyNavigationController

#pragma mark - rotation iOS 5 
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

#pragma mark - rotation iOS 6 
-(NSUInteger)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}

@end
