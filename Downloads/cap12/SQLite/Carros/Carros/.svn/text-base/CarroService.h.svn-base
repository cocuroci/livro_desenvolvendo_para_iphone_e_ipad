//
//  CarroService.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarroService : UIViewController {
}

+ (NSMutableArray *) getCarros;

// Busca por esportivos, clássicos e luxo
+ (NSMutableArray *) getCarrosByTipo :(NSString *) tipo;

// Busca por esportivos, clássicos e luxo.
// Cache = YES: Indica que o banco de dados deve ser consultado
// Cache = NO: Indica que a busca deve ser feita online
+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo cache:(BOOL)cache;

// Parser de XML com SAX
+ (NSMutableArray *) parserXML_SAX :(NSData *) data;

// Parser de XML com DOM
+ (NSMutableArray *) parserXML_DOM :(NSData *) data;

// Parser de JSON
+ (NSMutableArray *) parserJSON :(NSData *) data;

@end