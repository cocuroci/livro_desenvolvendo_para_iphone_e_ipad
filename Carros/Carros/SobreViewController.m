//
//  SobreViewController.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "SobreViewController.h"
#define URL_SOBRE @"http://www.livroiphone.com.br/carros/sobre.htm"

@interface SobreViewController ()

@end

@implementation SobreViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Sobre"; 
    
    
    //carrega a URL no webview
    NSURL *url = [NSURL URLWithString:URL_SOBRE];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //inicia animação
    [self.progress startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //para a animação
    [self.progress stopAnimating];
}

#pragma mark - dealloc
- (void)dealloc {
    [_webView release];
    [_progress release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [self setProgress:nil];
    [super viewDidUnload];
}

@end
