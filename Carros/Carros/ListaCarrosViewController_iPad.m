//
//  ListaCarrosViewController_iPad.m
//  Carros
//
//  Created by André Cocuroci on 12/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController_iPad.h"

@interface ListaCarrosViewController_iPad ()

@end

@implementation ListaCarrosViewController_iPad

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger linha = indexPath.row;
    Carro *c = [self.carros objectAtIndex:linha];
    self.detalhesController.carro = c;
    [self.detalhesController exibeCarro];
}

- (void)transacaoAtualizarInterface
{
    [super transacaoAtualizarInterface];
    
    BOOL vertical = self.detalhesController.popController != nil;
    
    if (self.carros && [self.carros count] > 0 && !vertical) {
        Carro *c = [self.carros objectAtIndex:0];
        self.detalhesController.carro = c;
        [self.detalhesController exibeCarro];
        [self.tableView reloadData];
    }
}

-(void)dealloc
{
    [self.detalhesController release];
    [super dealloc];
}

@end
