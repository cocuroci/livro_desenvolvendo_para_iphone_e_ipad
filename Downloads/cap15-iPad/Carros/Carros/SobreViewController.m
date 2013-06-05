//
//  SobreViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "SobreViewController.h"
#import "Utils.h"

#define URL_SOBRE @"http://www.livroiphone.com.br/carros/sobre.htm"

@implementation SobreViewController

@synthesize webView, progress;

#pragma mark View LifeCycle
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // Título
    self.title = @"Sobre";
    
    // Inicia a animação do activity indicator
    [self.progress startAnimating];
    // Carrega a URL no WebView
    NSURL* url = [NSURL URLWithString:URL_SOBRE];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    // Informa o delegate para receber os eventos
    [self.webView setDelegate:self];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
//    [progress stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    // Em caso de erro vai cair aqui. Exemplo URL inválida
    NSLog(@"Erro: %@", [error description]);
//    [progress stopAnimating];
}

#pragma mark rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    BOOL iPad = [Utils isIpad];
    if(iPad) {
        // iPad suporta todas as orientações
        return YES;
    } else {
        // iPhone: Apenas vertical
        return UIInterfaceOrientationPortrait;
    }
}
#pragma mark rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    BOOL iPad = [Utils isIpad];
    if(iPad) {
        // iPad suporta todas as orientações
        return UIInterfaceOrientationMaskAll;
    } else {
        // iPhone: Apenas vertical
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark dealloc
- (void)dealloc {
    [self.webView release];
    [self.progress release];

    [super dealloc];
}

@end