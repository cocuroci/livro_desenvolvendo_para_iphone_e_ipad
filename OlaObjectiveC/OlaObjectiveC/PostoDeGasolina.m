//
//  PostoDeGasolina.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "PostoDeGasolina.h"

@implementation PostoDeGasolina

+(void)abastecerCarroComAlcool:(NSObject<CombustivelAlcool> *)tipoAlcool
{
    [tipoAlcool abastecerComAlcool];
}

+(void)abastecerCarroComGasolina:(NSObject<CombustivelGasolina> *)tipoGasolina
{
    [tipoGasolina abastecerComGasolina];
}

@end
