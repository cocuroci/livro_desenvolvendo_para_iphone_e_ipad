//
//  Carro.h
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombustivelFlex.h"

@interface Carro : NSObject <CombustivelFlex>
{
    NSString *nome;
    int ano;
}

-(Carro *)initWithNome:(NSString *)_nome andAno:(int)_ano;

-(void)setNome:(NSString *)_nome;
-(NSString *)getNome;
-(void)setAno:(int)_ano;
-(int)getAno;
-(void)acelearComVelocidade:(int)velocidade eDistancia:(int)distancia;

@end
