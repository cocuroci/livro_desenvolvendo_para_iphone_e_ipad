//
//  VideoUtil.m
//  Carros
//
//  Created by André Cocuroci on 01/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "VideoUtil.h"
#import "Alerta.h"

@implementation VideoUtil

- (void)playFile:(NSString *)file withView:(UIView *)view
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    
    if(path) {
        NSURL *url = [NSURL URLWithString:path];
        NSLog(@"%@", url);
        [self playUrl:url withView:view];
    }
}

-(void)playUrl:(NSURL *)url withView:(UIView *)view
{
    @try {
        if (!self.player) {
            self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
            [self.player prepareToPlay];
            [self.player.view setFrame:view.bounds];
            [view addSubview:self.player.view];
        }
        
        [self.player play];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}

- (void)playFileFullScreen:(NSString *)file controller:(UIViewController *)controller
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    NSURL *url = [NSURL URLWithString:path];
    
    VideoUtil *v = [[[VideoUtil alloc] init] autorelease];
    [v playUrlFullScreen:url controller:controller];
}

- (void)playUrlFullScreen:(NSURL *)file controller:(UIViewController *)controller
{
    @try {
        MPMoviePlayerViewController *mp = [[[MPMoviePlayerViewController alloc] initWithContentURL:file] autorelease];
        
        [mp retain];
        
        [controller presentMoviePlayerViewControllerAnimated:mp];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}

- (void)pause
{
    [self.player pause];
}

- (void)stop
{
    [self.player stop];
    self.player = nil;
}

-(void)dealloc
{
    [self.player release];
    [super dealloc];
}

@end
