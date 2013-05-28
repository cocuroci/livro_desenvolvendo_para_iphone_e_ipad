//
//  PostoDeGasolina.h
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombustivelAlcool.h"
#import "CombustivelGasolina.h"

@interface PostoDeGasolina : NSObject

+(void)abastecerCarroComAlcool:(NSObject<CombustivelAlcool> *)tipoAlcool;
+(void)abastecerCarroComGasolina:(NSObject<CombustivelGasolina> *)tipoGasolina;

@end
