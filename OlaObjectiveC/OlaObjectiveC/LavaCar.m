//
//  LavaCar.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "LavaCar.h"

@implementation LavaCar
@synthesize carro;

-(void)lavarCarro
{
    NSLog(@"Lavando o carro %@ (%d)", [self.carro getNome], [self.carro getAno]);
}

-(void)dealloc
{
    [self.carro release];
    [super dealloc];    
    NSLog(@"Tchau LavaCar");
}

@end
