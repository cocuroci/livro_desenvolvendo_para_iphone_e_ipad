//
//  AppDelegate.m
//  OlaMundo
//
//  Created by Ricardo Lecheta on 9/8/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"
#import "MeuPrimeiroViewController.h"
#import "MyNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];

    // Cria o controller
    MeuPrimeiroViewController *m = [[[MeuPrimeiroViewController alloc] init] autorelease];

    // Cria o navigation controller e o inicializa com o controller desejado
    MyNavigationController *nav = [[[MyNavigationController alloc] initWithRootViewController:m] autorelease];
//    nav.navigationBar.hidden = YES;

    // Deixa o navigation controller como principal
    self.window.rootViewController = nav;
    
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark rotation - iOS 6
//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    NSLog(@"app delegate");
//    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft;
//}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;

    if(iPad) {
        // iPad suporta todas as orientações
        return UIInterfaceOrientationMaskAll;
    } else {
        // iPhone suporta todas menos de ponta cabeça
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
}

#pragma mark App Delegate
- (void)dealloc
{
    [_window release];
    [super dealloc];
}


@end
