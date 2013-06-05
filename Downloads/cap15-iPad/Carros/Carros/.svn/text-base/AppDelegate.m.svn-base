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
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.backgroundColor = [UIColor whiteColor];

    BOOL iPad = [Utils isIpad];
    if(iPad) {
        [self initIpad];
    } else {
        [self initIphone];
    }

    [self.window makeKeyAndVisible];

    return YES;
}

- (void)initIphone {
    // Tab 1: Cria um NavigationController com o ListaCarrosViewController
    ListaCarrosViewController *listaController = [[[ListaCarrosViewController alloc] init] autorelease];
    MyNavigationController *nav1 = [[[MyNavigationController alloc] init] autorelease];
    [nav1 pushViewController:listaController animated:NO];
    
    // Tab 2: Cria um NavigationController com o SobreViewController
    SobreViewController *sobreController = [[[SobreViewController alloc] init] autorelease];
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
}

- (void)initIpad {
    // Esquerda: Cria um NavigationController com o ListaCarrosViewController
    ListaCarrosViewController_iPad *listaController = [[[ListaCarrosViewController_iPad alloc] initWithNibName:@"ListaCarrosViewController" bundle:nil] autorelease];
    MyNavigationController *nav1 = [[[MyNavigationController alloc] init] autorelease];
    [nav1 pushViewController:listaController animated:NO];
    
    // Direita: Cria um NavigationController com o DetalhesCarroViewController
    DetalhesCarroViewController_iPad *detalhesController = [[[DetalhesCarroViewController_iPad alloc] init] autorelease];
    MyNavigationController *nav2 = [[[MyNavigationController alloc] init] autorelease];
    [nav2 pushViewController:detalhesController animated:NO];
    
    // Seta os detalhes na lista
    listaController.detalhesController = detalhesController;

    // Cria o UISplitViewController (Esquerda = Lista, Direita = Detalhes)
    UISplitViewController *split = [[[UISplitViewController alloc] init] autorelease];
    split.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nil];
    
    // Delegate do Split
    split.delegate = detalhesController;
    
    // Deixa o UISplitViewController como o controller principal
    self.window.rootViewController = split;
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
