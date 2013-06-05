//
//  ViewController.h
//  HelloMusica
//
//  Created by Ricardo Lecheta on 10/12/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoundUtil.h"
#import "SoundRecordUtil.h"

@interface ViewController : UIViewController

- (IBAction) play;
- (IBAction) pause;
- (IBAction) stop;

- (IBAction) startRecord;
- (IBAction) stopRecord;
- (IBAction) playRecord;

@property (nonatomic, strong) SoundUtil *sound;
@property (nonatomic, strong) SoundRecordUtil *soundRecord;
@end
