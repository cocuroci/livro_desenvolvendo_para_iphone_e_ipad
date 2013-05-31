//
//  Carro.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "Carro.h"

@implementation Carro


- (void)dealloc
{
    [_nome release];
    [_desc release];
    [_url_foto release];
    [_url_info release];
    [_url_video release];
    [_latitude release];
    [_longitude release];
    [super dealloc];
}

@end
