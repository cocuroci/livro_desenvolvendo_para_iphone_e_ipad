//
//  DetalhesCarroViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"
#import "CarroDBCoreData.h"
#import "MapaViewController.h"
#import "VideoViewController.h"
#import "Alerta.h"
#import "Utils.h"

@implementation DetalhesCarroViewController

@synthesize carro;
@synthesize tDesc, img, imgHorizontal;

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self exibeCarro];    

    // Verifica se está na horizontal e configura a tela
    if([Utils isIphone] && [Utils isLandscape]) {
        self.view = viewHorizontal;
        self.tabBarController.tabBar.hidden = YES;
        self.navigationController.navigationBar.hidden = YES;
    }
    
    // Insere o botão editar na navigation bar
	UIBarButtonItem *btEditar = [[[UIBarButtonItem alloc] initWithTitle:@"Editar"
        style:UIBarButtonItemStyleBordered target:self action:@selector(editar)] autorelease];
    self.navigationItem.rightBarButtonItem = btEditar;
}

- (void)exibeCarro
{
    // Título da Navigation Bar é o nome do carro
    self.title = carro.nome;
    
    // Atualiza o texto das views
    self.tDesc.text = carro.desc;
    
    // Foto: DownloadImageView
    self.img.url  = carro.url_foto;
    self.imgHorizontal.url  = carro.url_foto;
}

#pragma mark - Editar ou Excluir
- (void)editar {
	// Exibe um alerta para Salvar ou Excluir o carro
	UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Salvar ou Excluir" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"Salvar",@"Excluir", nil];
    [alerta setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alerta show];
	// Preenche o campo de texto com o nome do carro
    [[alerta textFieldAtIndex:0] setText:carro.nome];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	// Abre o banco de dados
	CarroDBCoreData *db = [[[CarroDBCoreData alloc] init] autorelease];

	if(buttonIndex == 0) {
		// Salva o carro
		NSString *novoNome = [[alertView textFieldAtIndex:0] text];
		carro.nome = novoNome;
		[db salvar:carro];
		// Atualiza o titulo do controller
		self.title = carro.nome;
	} else if (buttonIndex == 1){
		// Deleta o carro
		[db deletar:carro];
		// Fecha esta tela
		[self.navigationController popViewControllerAnimated:YES];// Salvar: atualiza o nome do carro com o texto digitado
	}
}

#pragma mark rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Todas menos de ponta cabeça
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}
#pragma mark rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    // Todas menos de ponta cabeça
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

#pragma mark rotation
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    if ([Utils isIphone]) {    
        if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
            self.view = viewHorizontal;
            // Horizontal: Esconde a TabBar e Navigation Bar
            self.tabBarController.tabBar.hidden = YES;
            self.navigationController.navigationBar.hidden = YES;
        } else {
            self.view = viewVertical;
            // Vertical: Exibe a TabBar e Navigation Bar
            self.tabBarController.tabBar.hidden = NO;
            self.navigationController.navigationBar.hidden = NO;
        }
    }
}

#pragma mark dealloc
- (void)dealloc {
    [carro release];
    [img release];
    [imgHorizontal release];
    [tDesc release];
    [super dealloc];
}

- (IBAction)visualizarMapa:(id)sender
{
    MapaViewController *map = [[[MapaViewController alloc] init] autorelease];
    map.carro = self.carro;
    [self.navigationController pushViewController:map animated:YES];
}

- (IBAction)visualizarVideo:(id)sender
{    
    if (self.carro.url_video) {
        //VideoViewController *controller = [[[VideoViewController alloc] init] autorelease];
        //controller.carro = self.carro;
        //[self.navigationController pushViewController:controller animated:YES];        
        self.videoUtil = [[VideoUtil alloc] init];
        [self.videoUtil playUrlFullScreen:[NSURL URLWithString:self.carro.url_video] controller:self];
        
    } else {
        [Alerta alerta:@"Nenhum vídeo para este carro"];
    }
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}
@end