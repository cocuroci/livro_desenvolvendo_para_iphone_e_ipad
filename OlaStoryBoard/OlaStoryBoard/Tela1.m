//
//  Tela1.m
//  OlaStoryBoard
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Tela1.h"

@interface Tela1 ()

@end

@implementation Tela1

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue: %@", [segue identifier]);
}

- (IBAction)open:(id)sender
{
    [self performSegueWithIdentifier:@"tela4" sender:sender];
}
@end
