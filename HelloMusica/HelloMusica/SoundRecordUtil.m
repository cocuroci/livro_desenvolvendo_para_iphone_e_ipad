//
//  SoundRecordUtil.m
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import "SoundRecordUtil.h"

@implementation SoundRecordUtil

- (void)start:(NSURL *)url
{    
    //Inicia a sessão
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    //Cria a gravação do som no arquivo especificado
    soundRecord = [[AVAudioRecorder alloc] initWithURL:url settings:nil error:nil];
    soundRecord.delegate = self;
    
    //Inicia a gravação
    [soundRecord prepareToRecord];
    [soundRecord record];
}

-(void)stop
{
    [soundRecord stop];
    [[AVAudioSession sharedInstance] setActive:NO error:nil];
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag
{
    NSLog(@"Fim da gravação, sucesso %@", flag ? @"SIM" : @"NÃO");
}

@end
