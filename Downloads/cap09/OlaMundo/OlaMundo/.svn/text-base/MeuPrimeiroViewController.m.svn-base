//
//  MeuPrimeiroViewController.m
//  OlaMundo
//
//  Created by Ricardo Lecheta on 9/8/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "MeuPrimeiroViewController.h"
#import "MeuSegundoViewController.h"

@implementation MeuPrimeiroViewController

#pragma mark - view lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    meuPrimeiroLabel.text = @"Tela iniciada com sucesso!";

    // Título
    self.title = @"Primeiro Controller";

    // A própria classe implementa o UITextFieldDelegate para responder aos eventos
    meuPrimeiroTextField.delegate = self;
    meuSegundoTextField.delegate = self;
    
    // Cria a imagem e seta no UIImageView
    UIImage *image = [UIImage imageNamed:@"ferrari_ff.png"];
    imageView.image = image;
    
    // Customiza o botão voltar
    UIBarButtonItem *btVoltar = [[[UIBarButtonItem alloc] initWithTitle:@"Voltar"
                                                                  style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    self.navigationItem.backBarButtonItem = btVoltar;
}

#pragma mark - métodos
- (void)olaMundo:(id)sender {
    NSLog(@"Olá");

    if([meuPrimeiroTextField.text isEqualToString:@""] || [meuSegundoTextField.text isEqualToString:@""]) {
        UIAlertView *a = [[UIAlertView alloc] initWithTitle: @"Erro" message: @"Digite todos os campos" delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [a show];
        [a release];
        return;
    }
    
    // Cria a mensagem
    NSString *s = @"Olá ";
    s = [s stringByAppendingString:meuPrimeiroTextField.text];
    s = [s stringByAppendingString:@" "];
    s = [s stringByAppendingString:meuSegundoTextField.text];

    meuPrimeiroLabel.text = s;

    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];

    // Cria o segundo controller
    MeuSegundoViewController *segundo = [[[MeuSegundoViewController alloc] init] autorelease];
    segundo.msg = s;
    
    [self.navigationController pushViewController:segundo animated:YES];

    // Recupera a UIWindow que gerencia toda as telas do aplicativo
//    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    // Adiciona a view do segundo controller na window
//    UIView *view = segundo.view;
//    [window addSubview:view];
    
    // Navega como modal
//    segundo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//        [self presentViewController:segundo animated:YES completion:nil];
}

- (IBAction)sliderValueChanged:(id)sender {
    UISlider *slider = sender;
    imageView.alpha = [slider value];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == meuPrimeiroTextField) {
        // Navega para o próximo campo
        [meuSegundoTextField becomeFirstResponder];
        return YES;
    } else if(textField == meuSegundoTextField) {
        // Último campo então executa o método olaMundo
        [self olaMundo:textField];
        return YES;
    }
    return NO;
}

#pragma mark - UIResponder
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [meuPrimeiroTextField resignFirstResponder];
    [meuSegundoTextField resignFirstResponder];
}

#pragma mark - rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    // Todas menos de ponta cabeça
	return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark - rotation iOS 6
- (NSUInteger)supportedInterfaceOrientations {
//    return UIInterfaceOrientationMaskPortrait;
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


#pragma mark - dealloc
- (void)dealloc {
    [super dealloc];
    [meuPrimeiroLabel release];
    [meuPrimeiroTextField release];
    [meuSegundoTextField release];
    [imageView release];
}

@end
