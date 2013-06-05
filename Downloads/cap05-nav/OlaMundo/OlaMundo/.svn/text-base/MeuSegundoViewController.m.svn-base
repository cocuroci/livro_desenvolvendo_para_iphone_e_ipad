//
//  MeuSegundoViewController.m
//  OlaMundo
//
//  Created by Ricardo Lecheta on 9/9/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "MeuSegundoViewController.h"

@implementation MeuSegundoViewController

@synthesize msg;

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Título
    self.title = @"Segundo Controller";
    
    // Copia o conteúdo da mensagem para o label
    label.text = msg;
}

#pragma mark - Eventos

- (IBAction)voltar {
//    [self.view removeFromSuperview];
//    [self dismissViewControllerAnimated:YES completion:nil];

    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"voltar");
    
    
    
//    MeuSegundoViewController *s = [[MeuSegundoViewController alloc] init];
//    [self.navigationController pushViewController:s animated:YES];
//    [s release];
    
}

- (void)dealloc {
    [super dealloc];
    [msg release];
    msg = nil;
}

@end
