//
//  AppDelegate.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "AppDelegate.h"
#import "ListaCarrosViewController.h"
#import "SobreViewController.h"

#import "MyTabBarController.h"
#import "MyNavigationController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];

    // Tab 1: Cria um NavigationController com o ListaCarrosViewController
    ListaCarrosViewController *listaController = [[ListaCarrosViewController alloc] init];
    MyNavigationController *nav1 = [[[MyNavigationController alloc] init] autorelease];
    [nav1 pushViewController:listaController animated:NO];

    // Tab 2: Cria um NavigationController com o SobreViewController
    SobreViewController *sobreController = [[SobreViewController alloc] init];
    MyNavigationController *nav2 = [[[MyNavigationController alloc] init] autorelease];
    [nav2 pushViewController:sobreController animated:NO];

    // Cria a TabBarController (Tab 1 = Lista, Tab 2 = Sobre)
    MyTabBarController *tabBarController = [[[MyTabBarController alloc] init] autorelease];
    tabBarController.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nil];

    // Título e imagem de cada Tab
    nav1.tabBarItem.title = @"Carros";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tab_carros.png"];
    nav2.tabBarItem.title = @"Sobre";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tab_sobre.png"];

    // Deixa a TabBarController como o controller principal
    self.window.rootViewController = tabBarController;
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
