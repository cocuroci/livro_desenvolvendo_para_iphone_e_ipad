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
#import "HttpAsyncHelper.h"

#define URL_CARROS @"http://www.livroiphone.com.br/carros/carros_%@.xml"

@implementation ListaCarrosViewController

@synthesize carros;
@synthesize tipo;
@synthesize tableView;
@synthesize progress;

#pragma mark View LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Título
    self.title = @"Carros";
    
    // Isso é opcional, já que fizemos a ligação dos outlets no editor visual
	[self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    
    self.tipo = @"classicos";

    // Busca os carros
    [self atualizar];

    // Insere o botão atualizar na navigation bar
	UIBarButtonItem *btAtualizar = [[[UIBarButtonItem alloc]
                initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(atualizar)] autorelease];
	self.navigationItem.rightBarButtonItem = btAtualizar;
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

	// Buscar os carros por tipo (classico, esportivo, luxo)
    [self atualizar];
}

#pragma mark Métodos
- (void) atualizar {
	// Limpa o TableView antes da busca
    self.carros = nil;
	[tableView reloadData];
    
    // Inicia a animação
    [progress startAnimating];

	// URL
    NSString *url = [NSString stringWithFormat:URL_CARROS, tipo];
    NSLog(@"URL: %@", url);

	// Cria a classe HttpAsyncHelper
    HttpAsyncHelper *http = [[[HttpAsyncHelper alloc] init] autorelease];

	// Informa o delegate para receber o resultado
    [http setDelegate:self];

	// Dispara a requisição
    [http doGet:url];
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

#pragma mark HttpAsyncHelperDelegate

// Request finalizada com sucesso
- (void)requestEndWithData:(NSData *)data {

    // Para a animação
    [progress stopAnimating];
    
    // Faz o parser
    if(data && [data length] > 0) {
        carros = [CarroService parserXML_DOM:data];
    }
    
    // Se a lista de carros esta ok
    if(carros && [carros count] > 0)
    {
        [self.tableView reloadData];
    } else {
        [Alerta alerta:@"Nenhum carro encontrado."];
    }
}

// Erro na request
- (void)requestEndWithError:(NSError *)error {
    NSLog(@"Erro ao fazer a requisição %@", [error description]);
    [Alerta alerta:@"Servidor temporariamente indisponivel, por favor tente mais tarde"];
    [progress stopAnimating];
}

#pragma mark rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Apenas vertical
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark dealloc
- (void)dealloc {
    [tableView release];
    [progress release];
    [carros release];
    [tipo release];

    [super dealloc];
}

@end
