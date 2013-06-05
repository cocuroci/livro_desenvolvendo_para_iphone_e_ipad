//
//  LavaCar.m
//  OlaObjectiveC
//
//  Created by Ricardo Lecheta on 5/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LavaCar.h"

@implementation LavaCar

@synthesize carro;
/*
- (void)setCarro:(Carro *)_c {
    NSLog(@"retainCount %ld", [_c retainCount]);
//    // Faz release do objeto antigo
//    [carro release];
//    // Faz a troca e retain
//    carro = _c;
//    [carro retain];
}
*/
- (void)lavarCarro {
    NSLog(@"Lavando o carro %@ (%d)", [self.carro getNome], [self.carro getAno]);
}

- (void)dealloc {
    // Libera a memóra dos objetos
    [self.carro release];
    // Não esqueça de chamar o super
    [super dealloc];
    NSLog(@"Tchau LavaCar");
}

@end
