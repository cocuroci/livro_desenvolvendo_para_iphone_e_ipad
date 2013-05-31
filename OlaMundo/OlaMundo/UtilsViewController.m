//
//  UtilsViewController.m
//  OlaMundo
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "UtilsViewController.h"

@interface UtilsViewController ()

@end

@implementation UtilsViewController

+(UIView *)getCustomNavBarView:(NSString *)title
{
    UIView *view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)] autorelease];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.text = title;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:18];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [view addSubview:label];
    [label release];
    
    return view;
}

@end
