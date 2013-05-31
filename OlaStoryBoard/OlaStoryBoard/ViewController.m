//
//  ViewController.m
//  OlaStoryBoard
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fechar:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
