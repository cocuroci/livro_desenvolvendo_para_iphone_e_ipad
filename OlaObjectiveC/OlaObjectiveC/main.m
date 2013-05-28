//
//  main.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"
#import "VelocidadeException.h"
#import "PostoDeGasolina.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *s = @"String aqui";
        int numero = 7;
        double decimal = 12.5;
        
        NSLog(@"Texto: %@, número inteiro %d, numero decimal %f", s, numero, decimal);
        
        //Carro *c = [[Carro alloc] init];
        
        //[c setNome:@"Fusca"];
        //[c setAno:1943];
        
        Carro *c = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
        
        NSString *nome = [c getNome];
        int ano = [c getAno];
        
        NSLog(@"Carro %@ [%d]", nome, ano);
        
        [c acelearComVelocidade:110 eDistancia:1000];
        
        @try {
            [c acelearComVelocidade:121 eDistancia:1000];
        }
        @catch (VelocidadeException *e) {
            NSLog(@"Erro: %@",[e reason]);
        }
        @finally {
            
        }
        
        [PostoDeGasolina abastecerCarroComAlcool:c];
        [c release];
    }
    
    return 0;
}

