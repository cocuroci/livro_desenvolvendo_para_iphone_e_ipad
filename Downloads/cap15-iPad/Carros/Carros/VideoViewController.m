//
//  VideoViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/2/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "VideoViewController.h"

#import "VideoUtil.h"

@implementation VideoViewController

@synthesize webView;
@synthesize carro;
@synthesize videoUtil;

#pragma mark View LifeCycle
- (void)viewDidLoad {
    NSLog(@"%@ - Video: %@", self.carro.nome, self.carro.url_video);

    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    
    self.videoUtil = [[VideoUtil alloc] init];

    // 1) Abre no webview
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];

    // 2) Reproduz uma URL sobre uma view de marcação
    [self.videoUtil playUrl:url withView:self.webView];

    // 3) Reproduz um arquivo local sobre uma view de marcação
//    [self.videoUtil playFile:@"ferrari_ff.mp4" withView:self.webView];

    // 4) Reproduz em tela cheia
//    [self.videoUtil playUrlFullScreen:url controller:self];

    // 5) Reproduz um arquivo local em tela cheia
//    [self.videoUtil playFileFullScreen:@"ferrari_ff.mp4" controller:self];
    
    // 6) Abre no browser nativo saindo do app
//    [[UIApplication sharedApplication] openURL:url];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Adiciona a notificação para quando o vídeo encerrar
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFim)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification object:nil];

    // Adiciona a notificação do botão Done
    [[NSNotificationCenter defaultCenter] addObserver:self	selector:@selector(videoFim)                                                 name:MPMoviePlayerDidExitFullscreenNotification object:nil];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    
}

- (void)videoFim {
    NSLog(@"Fim do Video");

	// Vamos aproveitar e fechar este controller porque o vídeo já terminou
    [self.navigationController popViewControllerAnimated:YES];
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

#pragma mark dealloc
- (void)dealloc {
    [videoUtil release];
    [carro release];
    [webView release];
    [super dealloc];
}

@end