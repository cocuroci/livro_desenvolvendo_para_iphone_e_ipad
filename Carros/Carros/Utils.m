//
//  Utils.m
//  Carros
//
//  Created by André Cocuroci on 02/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (BOOL) isIphone
{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
}

+ (BOOL) isIpad
{
    return [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
}

+ (BOOL) isPortrait
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    return orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight;
}

+ (BOOL) isLandscape
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    return orientation == UIDeviceOrientationPortrait;
}

@end
