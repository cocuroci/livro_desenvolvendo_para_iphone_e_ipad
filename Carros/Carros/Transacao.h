//
//  Transacao.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Transacao <NSObject>

-(void)transacaoExecutar;
-(void)transacaoAtualizarInterface;

@end
