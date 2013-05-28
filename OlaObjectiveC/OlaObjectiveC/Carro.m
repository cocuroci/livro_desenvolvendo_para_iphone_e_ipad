//
//  Carro.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Carro.h"
#import "VelocidadeException.h"

@implementation Carro

-(Carro *)initWithNome:(NSString *)_nome andAno:(int)_ano
{
    self = [super init];
    
    if(self)
    {
        [self setNome:_nome];
        [self setAno:_ano];
    }
    
    return self;
}

-(void)setNome:(NSString *)_nome
{
    nome = _nome;
}

-(NSString *)getNome
{
    return nome;
}

-(void)setAno:(int)_ano
{
    ano = _ano;
}

-(int)getAno
{
    return ano;
}

-(void)acelearComVelocidade:(int)velocidade eDistancia:(int)distancia
{
    NSLog(@"Acelerar com velocidade: %d km/H e Distancia: %d metros", velocidade, distancia);
    
    if(velocidade > 120)
    {
        NSException *e = [VelocidadeException exceptionWithName:@"VelocidadeException" reason:@"Velocidade não permitida, dirija com cuidado" userInfo:nil];
        
        @throw e;
    }
}

-(void)dealloc
{
    [super dealloc];
    NSLog(@"Tchau carro");
}

#pragma mark - protocolo combustivel

-(void)abastecerComAlcool
{
    NSLog(@"Abastecendo com alcool");
}

-(void)abastecerComGasolina
{
     NSLog(@"Abastecendo com gasolina");
}


@end
