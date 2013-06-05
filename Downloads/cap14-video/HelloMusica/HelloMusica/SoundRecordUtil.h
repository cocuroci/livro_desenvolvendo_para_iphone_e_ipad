//
//  SoundRecordUtil.h
//  HelloMusica
//
//  Created by Ricardo Lecheta on 10/12/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundRecordUtil : NSObject <AVAudioRecorderDelegate>
{
    AVAudioRecorder *soundRecorder;
}

// Inicia e para a gravação
- (void) start:(NSURL *)url;
- (void) stop;

@end
