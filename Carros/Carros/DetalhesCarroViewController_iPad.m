//
//  DetalhesCarroViewController_iPad.m
//  Carros
//
//  Created by André Cocuroci on 12/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController_iPad.h"
#import "VideoUtil.h"

@interface DetalhesCarroViewController_iPad ()

@end

@implementation DetalhesCarroViewController_iPad

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

- (void)visualizarVideo:(id)sender
{
    VideoUtil *v = [[[VideoUtil alloc] init] autorelease];
    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    [v playUrl:url withView:self.videoView];
}

- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    barButtonItem.title = @"Carros";
    
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    
    self.popController = pc;
}

- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

-(void)exibeCarro
{
    [super exibeCarro];
    
    if (self.popController) {
        [self.popController dismissPopoverAnimated:YES];
    }
}

- (void)dealloc
{
    [self.videoView release];
    [super dealloc];
}

@end
