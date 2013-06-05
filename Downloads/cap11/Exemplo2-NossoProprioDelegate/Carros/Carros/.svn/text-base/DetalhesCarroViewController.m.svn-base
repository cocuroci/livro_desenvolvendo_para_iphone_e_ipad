//
//  DetalhesCarroViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"

@implementation DetalhesCarroViewController

@synthesize carro;
@synthesize tDesc, img;

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Título da Navigation Bar é o nome do carro
    self.title = carro.nome;

    // Atualiza o texto das views
    self.tDesc.text = carro.desc;

    // Foto: DownloadImageView
    self.img.url  = carro.url_foto;
    self.imgHorizontal.url  = carro.url_foto;

    // Verifica se está na horizontal e configura a tela
    UIDeviceOrientation o = [[UIDevice currentDevice] orientation];
    if(o == UIInterfaceOrientationLandscapeLeft ||o==UIInterfaceOrientationLandscapeRight) {
        self.view = viewHorizontal;

        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
    }
}

#pragma mark rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Todas menos de ponta cabeça
    return YES;
}
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
		self.view = viewHorizontal;
		// Horizontal: Esconde a TabBar e Navigation Bar
		self.tabBarController.tabBar.hidden = YES;
		self.navigationController.navigationBar.hidden = YES;
	} else {
		self.view = viewVertical;
		// Vertical: Exibe a TabBar e Navigation Bar
		self.tabBarController.tabBar.hidden = NO;
		self.navigationController.navigationBar.hidden = NO;
	}
}

#pragma mark dealloc
- (void)dealloc {
    [carro release];
    [img release];
    [tDesc release];
    [super dealloc];
}

@end