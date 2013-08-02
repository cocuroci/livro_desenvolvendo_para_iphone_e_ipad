//
//  SoundUtil.m
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import "SoundUtil.h"

@implementation SoundUtil

- (void)playFile:(NSString *)arquivo
{
    NSLog(@"play");
    if (!player) {
        NSString *path = [[NSBundle mainBundle] pathForResource:arquivo ofType:nil];        //path = [path stringByAppendingString:arquivo];
        
        NSLog(@"path %@", path);
        
        NSURL *url = [NSURL fileURLWithPath:path];
        [self playUrl:url];
    } else {
        [player play];
    }
}

- (void)playUrl:(NSURL *)url
{
    NSLog(@"URL %@", url);
    if (!player) {
        NSError *erro;
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&erro];
        [player setVolume:1.0];
        
        if (!erro) {
            player.delegate = self;
            [player play];
        } else {
            NSLog(@"Error: %@", [erro localizedDescription]);
        }
        
    } else {
        [player play];
    }
}

- (void)pause
{
    if (player) {
        [player pause];
    }
}

- (void)stop
{
    if (player) {
        [player stop];
        player = nil;
    }
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)aplayer successfully:(BOOL)flag
{
    NSLog(@"Fim da musica");
    player = nil;
}

@end
