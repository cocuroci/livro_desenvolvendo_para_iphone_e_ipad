//
//  SoundRecordUtil.h
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundRecordUtil : NSObject <AVAudioRecorderDelegate> {
    AVAudioRecorder *soundRecord;
}

- (void)start:(NSURL *)url;
- (void)stop;

@end
