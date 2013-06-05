//
//  ListaCarrosViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ListaCarrosViewController.h"
#import "Alerta.h"
#import "Carro.h"
#import "CarroCell.h"
#import "CarroService.h"
#import "DetalhesCarroViewController.h"

@implementation ListaCarrosViewController

@synthesize carros;
@synthesize tableView;

#pragma mark View LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Título
    self.title = @"Carros";
    
    // Isso é opcional, já que fizemos a ligação dos outlets no editor visual
	[self.tableView setDelegate:self];
    [self.tableView setDataSource:self];

    // Busca os carros
    self.carros = [CarroService getCarros];
}

#pragma mark - TableView
// Retorna a quantidade de linhas para criar a tabela, que é a quantidade de carros
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Retorna a quantidade de carros no array
    return [carros count];
}

// Retorna a célula que vai ser o conteúdo para a linha solicitada
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CarroCell";
	CarroCell *cell = (CarroCell*) [self.tableView dequeueReusableCellWithIdentifier: CellIdentifier];
	if (cell == nil) {
		cell = [[[NSBundle mainBundle] loadNibNamed:@"CarroCell" owner:self options:nil] objectAtIndex:0];
	}

	// Carro selecionado
	NSInteger linha = indexPath.row;

    Carro *carro = [carros objectAtIndex:linha];

	// Descrição
	cell.cellDesc.text = carro.nome;

	// Foto
	cell.cellImg.image = [UIImage imageNamed:carro.url_foto];

	return cell;
}

// Executa ao selecionar a linha do TableView
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Carro selecionado
	NSInteger linha = indexPath.row;

    Carro *c = [carros objectAtIndex:linha];

    // Navega para a tela de detalhes
    DetalhesCarroViewController *detalhes = [[[DetalhesCarroViewController alloc] init] autorelease];
    detalhes.carro = c;

    [self.navigationController pushViewController:detalhes animated:YES];
}

#pragma mark rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Apenas vertical
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark dealloc
- (void)dealloc {
    [tableView release];
    [carros release];
    [super dealloc];
}

@end
