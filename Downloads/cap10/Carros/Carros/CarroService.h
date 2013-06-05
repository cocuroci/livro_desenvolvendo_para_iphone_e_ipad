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

// Parser de XML com SAX
+ (NSMutableArray *) parserXML_SAX :(NSData *) data;

//Parser de XML com DOM
+ (NSMutableArray *) parserXML_DOM :(NSData *) data;

//Parser de JSON
+ (NSMutableArray *) parserJSON :(NSData *) data;

@end