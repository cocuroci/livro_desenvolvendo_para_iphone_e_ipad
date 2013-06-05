//
//  CarroDB.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/30/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SQLiteHelper.h"

#import "Carro.h"

@interface CarroDB : SQLiteHelper {
}

// Retorna o SQL para criar o carro
- (NSString *)getSQLCreate;

// Salva um novo carro ou atualiza um já existente pelo _id
- (void) salvar:(Carro *)carro;

// Deleta o carro
- (void) deletar:(Carro *)carro;

// Deleta todos os carros do tipo informando
- (void) deletarCarrosTipo:(NSString *)tipo;

// Seleciona todos os carros do tipo informando
- (NSMutableArray *) getCarrosTipo:(NSString *)tipo;

@end