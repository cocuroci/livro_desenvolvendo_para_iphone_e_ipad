//
//  SoundUtil.h
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundUtil : NSObject <AVAudioPlayerDelegate> {
    AVAudioPlayer *player;
}

- (void)playFile:(NSString *)arquivo;
- (void)playUrl:(NSURL *)url;
- (void)pause;
- (void)stop;

@end
