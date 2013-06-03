//
//  DetalhesViewController.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "DetalhesViewController.h"

@interface DetalhesViewController ()

@end

@implementation DetalhesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.carro.url_foto]];
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    self.title = self.carro.nome;
    self.tDesc.text = self.carro.desc;
    //self.img.image = [UIImage imageNamed:self.carro.url_foto];
    //self.imageHorizontal.image = [UIImage imageNamed:self.carro.url_foto];
    
    self.img.image = image;
    self.imageHorizontal.image = image;
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if(orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
    {
        self.view = self.viewHorizontal;
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - rotation iOS 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark - rotation iOS 6
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

#pragma mark - only rotation
-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view = self.viewHorizontal;
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
    } else {
        self.view = self.viewVertical;
        self.tabBarController.tabBar.hidden = NO;
        self.navigationController.navigationBar.hidden = NO;
    }
}

- (void)dealloc
{
    [_carro release];
    [_img release];
    [_tDesc release];
    [_viewHorizontal release];
    [_viewVertical release];
    [_imageHorizontal release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setViewHorizontal:nil];
    [self setViewVertical:nil];
    [self setImageHorizontal:nil];
    [super viewDidUnload];
}
@end
