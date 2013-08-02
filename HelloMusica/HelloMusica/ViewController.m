//
//  ViewController.m
//  HelloMusica
//
//  Created by André Cocuroci on 02/08/13.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.sound = [[SoundUtil alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    [self.sound playFile:@"thai.mp3"];
}

- (IBAction)pause:(id)sender {
    [self.sound pause];
}

- (IBAction)stop:(id)sender {
    [self.sound stop];
}

- (IBAction)startRecord:(id)sender {
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingString:@"musica.caf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    //Inicia a gracavao
    self.soundRecord = [[SoundRecordUtil alloc] init];
    [self.soundRecord start:url];
    NSLog(@"Start");
}

- (IBAction)stopRecord:(id)sender
{
    [self.soundRecord stop];
}

- (IBAction)plaRecord:(id)sender
{
    NSString *tempDir = NSTemporaryDirectory();
    NSString *path = [tempDir stringByAppendingString:@"musica.caf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.sound = [[SoundUtil alloc] init];
    [self.sound playUrl:url];
}

@end
