//
//  VideoUtil.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/2/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "VideoUtil.h"

@implementation VideoUtil

// Reproduz o vídeo dentro de um WebView (somente iOS 5)
- (void)playYouTubeUrl:(NSString *)url withWebView:(UIWebView *)webView {
    NSString *html = [NSString stringWithFormat:@"<iframe width='300' height='350' src='%@?fs=1&hl=en_US&rel=0&autoplay=1' frameborder='0' allowfullscreen></iframe>", url];

    [webView loadHTMLString:html baseURL:nil];
}

// Reproduz o vídeo com um player utilizando uma view como container
- (void)playFile:(NSString *)file withView:(UIView *)view {
    // Converte o nome do arquivo em NSURL
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];
    
    if(path) {
        NSURL *url = [NSURL fileURLWithPath:path];
        NSLog(@"URL %@", url);
        [self playUrl:url withView:view];
    }
}

// Reproduz o vídeo com um player utilizando uma view como container
- (void)playUrl:(NSURL *)url withView:(UIView *)view {
    @try {
        // Cria o componente que gerencia o video
        if(!player) {
            player = [[MPMoviePlayerController alloc] initWithContentURL: url];
            
            [player prepareToPlay];
            
            // Configura a view
            [player.view setFrame: view.bounds];
            [view addSubview: player.view];
        }
        
        // Inicia o video
        [player play];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}

// Reproduz o vídeo em tela cheia
- (void)playFileFullScreen:(NSString *)file controller:(UIViewController *)controller {
    // Converte o nome do arquivo em NSURL
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:nil];

    NSURL *url = [NSURL fileURLWithPath:path];

    VideoUtil *v = [[VideoUtil alloc] init];
    [v playUrlFullScreen:url controller:controller];
}

// Reproduz o vídeo em tela cheia
- (void)playUrlFullScreen:(NSURL *)url controller:(UIViewController *)controller {
    @try {
        // Cria o controller especializado em reproduzir video
        MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:url] ;

        // Exibe o controller como modal
        [controller presentMoviePlayerViewControllerAnimated:mp];
    }
    @catch (NSException *exception) {
        NSLog(@"Erro %@", [exception description]);
    }
}

- (void) pause {
    NSLog(@"pause");
    [player pause];
}

- (void) stop {
    NSLog(@"stop");
    [player stop];
    player = nil;
}

@end