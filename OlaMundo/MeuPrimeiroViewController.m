//
//  MeuPrimeiroViewController.m
//  OlaMundo
//
//  Created by André Cocuroci on 29/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "MeuPrimeiroViewController.h"

@implementation MeuPrimeiroViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    meuPrimeiroLabel.text = @"Tela iniciada com sucesso!";
}

-(IBAction)olaMundo
{
    NSLog(@"Olá mundo");
    meuPrimeiroLabel.text = @"Olá mundo iPhone!";
}

-(void)dealloc
{
    [meuPrimeiroLabel release];
    [super dealloc];
}

@end
