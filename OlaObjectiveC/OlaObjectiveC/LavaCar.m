//
//  LavaCar.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "LavaCar.h"

@implementation LavaCar


-(void)setCarro:(Carro *)_c
{
    [carro release];
    carro = _c;
    [carro retain];
}

-(void)lavarCarro
{
    NSLog(@"Lavando o carro %@ (%d)", [carro getNome], [carro getAno]);
}

-(void)dealloc
{
    [carro release];
    [super dealloc];    
    NSLog(@"Tchau LavaCar");
}

@end
