//
//  TransacaoUtil.m
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "TransacaoUtil.h"

@implementation TransacaoUtil

-(void)iniciarTransacao:(NSObject<Transacao> *)transacao
{
    self.transacao = transacao;
    
    if(!queue)
    {
        queue = [[NSOperationQueue alloc] init];
    }
    
    [queue cancelAllOperations];
    
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(executeOnBackground) object:nil];
    [queue addOperation:operation];
    [operation release];
}

#pragma mark - transação
//Executa em uma thread
-(void)executeOnBackground
{
    [self.transacao transacaoExecutar];
    [self performSelectorOnMainThread:@selector(executeOnUIThread) withObject:nil waitUntilDone:YES];
}

//Executa na thread principal
-(void)executeOnUIThread
{
    [self.transacao transacaoAtualizarInterface];
}

#pragma mark - dealloc
-(void)dealloc
{
    [queue release];
    [self.transacao release];
    [super dealloc];
}

@end