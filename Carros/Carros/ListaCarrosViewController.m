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
#import "TransacaoUtil.h"
#import "Prefs.h"
#import "Utils.h"

@implementation ListaCarrosViewController

@synthesize carros;
@synthesize tipo;
@synthesize tableView;
@synthesize progress;
@synthesize segmentControl;

#pragma mark View LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Título
    self.title = @"Carros";
    
    // Isso é opcional, já que fizemos a ligação dos outlets no editor visual
	[self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    // Recupera o tipo salvo nas preferências
    int idx = [Prefs getInteger:@"tipoIdx"];
    [self.segmentControl setSelectedSegmentIndex:idx];

    self.tipo = [Prefs getString:@"tipoString"];
    if(tipo == nil) {
        self.tipo = @"classicos";
    }

    // Liga o cache
    cache = YES;

    // Insere o botão atualizar na navigation bar
	UIBarButtonItem *btAtualizar = [[[UIBarButtonItem alloc]
                initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(atualizarOnline)] autorelease];
	self.navigationItem.rightBarButtonItem = btAtualizar;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Busca os carros
    [self atualizar];
}

#pragma mark - Segment Control
- (IBAction) alterarTipo:(id)sender {
    UISegmentedControl *sc = (UISegmentedControl *) sender;

	// Recupera o índice selecionado
    int idx = sc.selectedSegmentIndex;

    switch (idx) {
        case 0:
            self.tipo = @"classicos";
            break;
        case 1:
            self.tipo = @"esportivos";
            break;
        case 2:
            self.tipo = @"luxo";
            break;
    }

    // Salva o tipo nas preferências
    [Prefs setInteger:idx chave:@"tipoIdx"];
    [Prefs setString:tipo chave:@"tipoString"];

	// Buscar os carros por tipo (classico, esportivo, luxo)
    [self atualizar];
}

#pragma mark Métodos
- (void) atualizarOnline {
    cache = NO;

    [self atualizar];
}

- (void) atualizar {
	// Limpa o TableView antes da busca
    self.carros = nil;
	[tableView reloadData];
    
    // Inicia a animação
    [progress startAnimating];

    // Inicia a transação
	TransacaoUtil *tm = [[[TransacaoUtil alloc] init] autorelease];
    [tm inicarTransacao:self];
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
    cell.cellImg.url = carro.url_foto;
    
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

#pragma mark Transacao

// Executa em uma thread
- (void) transacaoExecutar {
    // Busca os carros em apenas uma linha
    self.carros = [CarroService getCarrosByTipo:self.tipo cache:cache];

    // zera o flag cache
    cache = YES;
}

// Atualiza a interface. Executa na thread principal - UI Thread
- (void) transacaoAtualizarInterface {
    [progress stopAnimating];

    if(carros && [carros count] > 0)
    {
        [self.tableView reloadData];
    } else {
        [Alerta alerta:@"Nenhum carro encontrado."];
    }
}

#pragma mark rotation iOS 5
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    if ([Utils isIpad]) {
        return YES;
    } else {
        return UIInterfaceOrientationPortrait;
    }
}

#pragma mark rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Apenas vertical
    if ([Utils isIpad]) {
        return UIInterfaceOrientationMaskAll;
    } else {
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark dealloc
- (void)dealloc {
    [tableView release];
    [progress release];
    [carros release];
    [tipo release];
    [segmentControl release];

    [super dealloc];
}

@end
