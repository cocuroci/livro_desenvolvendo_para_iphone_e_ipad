//
//  CarroService.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "CarroService.h"
#import "Carro.h"

@implementation CarroService

+(NSMutableArray *)getCarros
{
    NSMutableArray *carros = [[[NSMutableArray alloc] init] autorelease];
    
    for(int i = 0; i < 20; i++)
    {
        Carro *c = [[Carro alloc] init];
        c.nome = [NSString stringWithFormat:@"Carro %d",i];
        c.desc = [NSString stringWithFormat:@"Desc Carro %d",i];
        c.url_foto = @"ferrari_ff.png";
        c.url_info = @"http://www.google.com.br";
        [carros addObject:c];
        [c release];
    }
    
    return carros;
}

@end
