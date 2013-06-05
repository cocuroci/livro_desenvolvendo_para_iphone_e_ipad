//
//  ViewController.m
//  HelloMusica
//
//  Created by Ricardo Lecheta on 10/12/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"
#import "SoundRecordUtil.h"

@implementation ViewController

@synthesize sound;

-  (void)viewDidLoad {
    [super viewDidLoad];

    // Inicia a música
    self.sound = [[SoundUtil alloc] init];
}

- (void)play {
    // Toca a música thai.mp3
    [self.sound playFile:@"thai.mp3"];
}

- (void)pause {
    // Pause na música
    [self.sound pause];
}

- (void)stop {
    // Para a música
    [self.sound stop];
}

- (void)startRecord {
    // Cria o arquivo para gravar
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingString: @"musica.caf"];
    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];

    // Inicia a gravação
    self.soundRecord = [[SoundRecordUtil alloc] init];
    [self.soundRecord start:url];
    NSLog(@"start");
}

- (void)stopRecord {
    // Para a gravação
    [self.soundRecord stop];
    NSLog(@"stop");
}

- (void)playRecord {
    // Toca a música gravada
    NSString *tempDir = NSTemporaryDirectory();
    
    // Caminho do arquivo de destino para gravar
    NSString *path = [tempDir stringByAppendingString: @"musica.caf"];
    
    NSURL *url = [[NSURL alloc] initFileURLWithPath: path];
    
    NSLog(@"url %@", url);

    self.sound = [[SoundUtil alloc] init];
    [self.sound playUrl:url];
}

@end
