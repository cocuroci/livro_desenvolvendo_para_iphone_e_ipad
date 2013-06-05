//
//  TransactionManager.h
//  Carros
//
//  Created by Ricardo Lecheta on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transacao.h"

@interface TransacaoUtil : NSObject
{
    NSOperationQueue *queue;
}
- (void)inicarTransacao:(NSObject<Transacao> *)transacao;
@property (nonatomic, strong) NSObject<Transacao> * transacao;
@end
