//
//  VideoUtil.h
//  Carros
//
//  Created by Ricardo Lecheta on 10/2/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MediaPlayer/MediaPlayer.h>

@interface VideoUtil : NSObject
{
    // Player de vídeo
    MPMoviePlayerController *player;
}

// Reproduz o vídeo dentro do WebView, utilizado no caso do YouTube
- (void)playYouTubeUrl:(NSString *)url withWebView:(UIWebView *)webView;

// Reproduz um vídeo (ex: .mp4) com um player utilizando uma view como container
- (void)playFile:(NSString *)file withView:(UIView *)view;
- (void)playUrl:(NSURL *)url withView:(UIView *)view;

// Reproduz um vídeo (ex: .mp4) em tela cheia
- (void)playFileFullScreen:(NSString *)file controller:(UIViewController *)controller;
- (void)playUrlFullScreen:(NSURL *)url controller:(UIViewController *)controller;

- (void) pause;
- (void) stop;

@end
