//
//  SoundRecordUtil.m
//  HelloMusica
//
//  Created by Ricardo Lecheta on 10/12/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "SoundRecordUtil.h"

@implementation SoundRecordUtil

- (IBAction)start:(NSURL *)url {

    AVAudioSession *audioSession = [AVAudioSession sharedInstance];

    // Inicia a sessão
    [audioSession setActive: YES error: nil];
    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error:nil];

    // Cria a gravação do som no arquivo especificado
    soundRecorder = [[AVAudioRecorder alloc] initWithURL: url settings:nil error:nil];
    soundRecorder.delegate = self;
    
    // Inicia a gravação
    [soundRecorder prepareToRecord];
    [soundRecorder record];
}

- (void)stop {
    // Para a gravação
    [soundRecorder stop];

    [[AVAudioSession sharedInstance] setActive: NO error: nil];
}

#pragma mark AVAudioRecorderDelegate
- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    NSLog(@"Fim da gravação, sucesso: %@", flag ? @"sim":@"não");
}

@end
