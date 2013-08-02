//
//  ViewController.h
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import <UIKit/UIKit.h>
#import "SoundUtil.h"
#import "SoundRecordUtil.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) SoundUtil *sound;
@property (nonatomic, strong) SoundRecordUtil *soundRecord;

- (IBAction)play:(id)sender;
- (IBAction)pause:(id)sender;
- (IBAction)stop:(id)sender;

- (IBAction)startRecord:(id)sender;
- (IBAction)stopRecord:(id)sender;
- (IBAction)plaRecord:(id)sender;
@end
