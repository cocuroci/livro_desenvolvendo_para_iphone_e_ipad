//
//  Utils.m
//  Carros
//
//  Created by Ricardo Lecheta on 8/20/12.
//
//

#import "Utils.h"

@implementation Utils

+ (BOOL) isIphone {
    BOOL iPhone = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
    return iPhone;
}

+ (BOOL) isIpad {
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    return iPad;
}

+ (BOOL)isLandscape {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

    BOOL landscape = orientation == UIDeviceOrientationLandscapeLeft || orientation==UIDeviceOrientationLandscapeRight;
    return landscape;
}

+ (BOOL)isPortrait {
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];

    BOOL portrait = orientation == UIDeviceOrientationPortrait;
    return portrait;
}

@end