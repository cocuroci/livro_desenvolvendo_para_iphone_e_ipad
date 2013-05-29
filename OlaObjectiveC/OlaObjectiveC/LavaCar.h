//
//  LavaCar.h
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"

@interface LavaCar : NSObject
{
    Carro *carro;
}

@property (nonatomic, retain) Carro *carro;

-(void)setCarro:(Carro *)_c;
-(void)lavarCarro;

@end
