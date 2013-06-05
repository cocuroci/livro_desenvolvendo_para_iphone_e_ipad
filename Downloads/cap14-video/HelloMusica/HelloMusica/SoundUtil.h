//
//  Som.h
//  VideoAula1
//
//  Created by Ricardo Lecheta on 7/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SoundUtil : NSObject <AVAudioPlayerDelegate> {

	AVAudioPlayer *player;
}

- (IBAction)playFile :(NSString *)arquivo;
- (IBAction)playUrl :(NSURL *)url;
- (IBAction)pause;
- (IBAction)stop;

@end
