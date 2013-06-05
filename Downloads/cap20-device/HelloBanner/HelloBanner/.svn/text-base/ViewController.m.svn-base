//
//  ViewController.m
//  HelloBanner
//
//  Created by Ricardo Lecheta on 10/6/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

#pragma mark ADBannerViewDelegate

- (void)bannerViewWillLoadAd:(ADBannerView *)banner {
    NSLog(@"1 - Anúncio será exibido.");
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner {
    NSLog(@"2 - Anúncio foi exibido ao usuário.");
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave {
    NSLog(@"3 - Usuario clicou no anúncio.");
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner {
    NSLog(@"4 - Usuário terminou de interagir com o anúncio.");
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
    NSLog(@"Ocorreu um erro ao exibir o anúncio.");
}


@end
