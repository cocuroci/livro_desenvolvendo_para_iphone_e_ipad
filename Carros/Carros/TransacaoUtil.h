//
//  TransacaoUtil.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transacao.h"

@interface TransacaoUtil : NSObject
{
    NSOperationQueue *queue;
}

-(void)iniciarTransacao:(NSObject<Transacao> *)transacao;
@property (nonatomic, retain) NSObject<Transacao> *transacao;

@end
