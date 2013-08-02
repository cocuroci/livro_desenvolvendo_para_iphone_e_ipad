//
//  VideoViewController.m
//  Carros
//
//  Created by André Cocuroci on 01/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@ - Video: %@", self.carro.nome, self.carro.url_video);
    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //[self.webView loadRequest:request];
    
    self.videoUtil = [[VideoUtil alloc] init];
    
    //[self.videoUtil playUrl:url withView:self.webView];
    [self.videoUtil playUrlFullScreen:url controller:self];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFim) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(videoFim) name:MPMoviePlayerDidExitFullscreenNotification object:nil];
}

- (void)videoFim
{
    NSLog(@"Fim do video");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_videoUtil release];
    [_carro release];
    [_webView release];
    [super dealloc];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.videoUtil pause];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidExitFullscreenNotification object:nil];
}

- (void)viewDidUnload {    
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
