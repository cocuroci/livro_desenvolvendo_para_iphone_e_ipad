//
//  XMLCarroParser.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Carro.h"

/*
 Delegate para fazer o parser por SAX
 */
@interface XMLCarroParser :NSObject <NSXMLParserDelegate> {
    // Lista de Carros (no final do parser)
    NSMutableArray *carros;

    // Variáveis auxiliares para o parser
    NSMutableString *tempString;
    Carro *carro;
}

// para criar o getter [XMLCarroParser getCarros];
@property (nonatomic, retain) NSMutableArray *carros;

@end
