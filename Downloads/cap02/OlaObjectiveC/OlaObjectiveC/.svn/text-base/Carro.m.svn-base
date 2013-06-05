//
//  Carro.m
//  OlaObjectC
//
//  Created by Ricardo Lecheta on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Carro.h"
#import "VelocidadeException.h"

@implementation Carro

- (Carro *) initWithNome:(NSString *)_nome andAno:(int)_ano {
    self = [super init];
    
    if(self) {
        [self setNome:_nome];
        [self setAno:_ano];
    }
    
    return self;
}

- (void) setNome:(NSString*)_nome {
    nome = _nome;
}

- (NSString *) getNome {
    return nome;
}

- (void) setAno:(int)_ano {
    ano = _ano;
}

- (int) getAno {
    return ano;
}

- (void) acelerar:(int) velocidade eDistancia:(int) distancia {
    NSLog(@"Acelerar com velocidade: %d km/H e Distância: %d metros", velocidade, distancia);
    
    if(velocidade > 120) {
        // throw overflow
        NSException *e = [VelocidadeException
                          exceptionWithName: @"VelocidadeException"
                          reason: @"Velocidade não permitida, diriga com cuidado."
                          userInfo: nil];
        @throw e;
    }
}


- (void) dealloc {
    NSLog(@"Tchau carro");
    [super dealloc];
}

#pragma mark equals e hash

- (BOOL)isEqual:(id)object {
    Carro *c = (Carro *) object;
    return [nome isEqual:[c getNome]];
}

- (NSUInteger)hash {
    return nome.hash;
}

#pragma mark - protocolo combustivel
- (void)abastecerComAlcool {
    NSLog(@"Abastecendo com Álcool");
}

- (void) abastecerComGasolina {
    NSLog(@"Abastecendo com Gasolina");
}

@end
