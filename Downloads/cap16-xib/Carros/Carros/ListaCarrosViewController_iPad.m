//
//  ListaCarrosViewController_iPad.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/14/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController_iPad.h"
#import "Utils.h"

@implementation ListaCarrosViewController_iPad

@synthesize detalhesController;

// Executa ao selecionar a linha do TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Carro selecionado
    NSInteger linha = indexPath.row;
    Carro *c = [self.carros objectAtIndex:linha];
	// Exibe o carro no controller da direita
	self.detalhesController.carro = c;

	[self.detalhesController exibeCarro];
}

- (void) transacaoAtualizarInterface {
    [super transacaoAtualizarInterface];
    // Exibe o primeiro carro na direita por padrão

    // Se o popover está aberto, não vamos atualizar a tela automaticamente
    BOOL vertical = self.detalhesController.popoverController != nil;

    if(self.carros && [self.carros count] > 0 && !vertical)
    {
        Carro *c = [self.carros objectAtIndex:0];
        self.detalhesController.carro = c;
        NSLog(@"Carro %@", self.detalhesController.carro.nome);

        [self.detalhesController exibeCarro];

        [self.tableView reloadData];
    }
}

- (void)dealloc {
    [detalhesController release];
    [super dealloc];
}

@end
