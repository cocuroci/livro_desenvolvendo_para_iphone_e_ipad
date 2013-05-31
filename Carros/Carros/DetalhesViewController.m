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
    
    self.title = self.carro.nome;
    self.tDesc.text = self.carro.desc;
    self.img.image = [UIImage imageNamed:self.carro.url_foto];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_carro release];
    [_img release];
    [_tDesc release];
    [super dealloc];
}

@end
