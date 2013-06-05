//
//  CarroService.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "CarroService.h"

#import "Carro.h"

@implementation CarroService

+ (NSMutableArray *) getCarros {
    NSMutableArray *carros = [[[NSMutableArray alloc] init] autorelease];

    for (int i = 0; i < 20; i++) {
        Carro *c = [[Carro alloc] init];

        [c setNome:[NSString stringWithFormat:@"Carro %d", i]];
        [c setDesc:[NSString stringWithFormat:@"Desc Carro %d", i]];
        [c setUrl_foto:@"Ferrari_FF.png"];
        [c setUrl_info:@"http://www.google.com.br"];

        [carros addObject:c];
        
        [c release];
    }

    return carros;
}

@end