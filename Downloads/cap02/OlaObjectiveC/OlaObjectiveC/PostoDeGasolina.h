//
//  PostoDeGasolina.h
//  OlaObjectiveC
//
//  Created by Ricardo Lecheta on 5/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombustivelGasolina.h"
#import "CombustivelAlcool.h"

@interface PostoDeGasolina : NSObject
+ (void) abastecerCarroComAlcool:(NSObject<CombustivelAlcool> *) tipoAlccol;
+ (void) abastecerCarroComGasolina:(NSObject<CombustivelGasolina> *) tipoGasolina;
@end
