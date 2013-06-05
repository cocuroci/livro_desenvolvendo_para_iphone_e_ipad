//
//  AppDelegate.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"
#import "ListaCarrosViewController.h"
#import "ListaCarrosViewController_iPad.h"
#import "SobreViewController.h"
#import "DetalhesCarroViewController.h"
#import "DetalhesCarroViewController_iPad.h"
#import "MyTabBarController.h"
#import "MyNavigationController.h"

#import "EsquerdaViewController.h"
#import "DireitaViewController.h"
#import "Utils.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark - rotation iOS 6
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    // Esta é a implementação padrão
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    if(iPad) {
        // iPad suporta todas as orientações
        return UIInterfaceOrientationMaskAll;
    } else {
        // iPhone suporta todas menos de ponta cabeça
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
