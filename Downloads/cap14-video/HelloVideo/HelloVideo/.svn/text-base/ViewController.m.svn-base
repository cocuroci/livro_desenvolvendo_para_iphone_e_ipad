//
//  ViewController.m
//  HelloVideo
//
//  Created by Ricardo Lecheta on 10/12/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize videoUtil;

- (void)viewDidLoad {
    // Inicia a música
    self.videoUtil = [[VideoUtil alloc] init];
}

- (void)play {
    // Reproduz o vídeo
    NSURL *url = [NSURL URLWithString:@"http://www.livroiphone.com.br/carros/esportivos/ferrari_ff.mp4"];
    [self.videoUtil playUrl:url withView:self.videoView];
}

- (void)pause {
    // Pause na música
    [self.videoUtil pause];
}

- (void)stop {
    // Para a música
    [self.videoUtil stop];
}

@end
