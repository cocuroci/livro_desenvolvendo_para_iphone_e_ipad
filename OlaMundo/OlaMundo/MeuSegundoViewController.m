//
//  MeuSegundoViewController.m
//  OlaMundo
//
//  Created by André Cocuroci on 29/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "MeuSegundoViewController.h"

@interface MeuSegundoViewController ()

@end

@implementation MeuSegundoViewController
@synthesize msg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    label.text = msg;
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    self.title = @"Segundo View Controller";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)voltar
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    [label release];
    [msg release];
    msg = nil;
    [super dealloc];
}
@end
