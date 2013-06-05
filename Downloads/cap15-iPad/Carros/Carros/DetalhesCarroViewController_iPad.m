//
//  DetalhesCarroViewController_iPad.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/14/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController_iPad.h"
#import "VideoUtil.h"

@implementation DetalhesCarroViewController_iPad

@synthesize videoView;
@synthesize popoverController;

#pragma mark orientation - iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark Métodos
- (void)visualizarVideo {
    videoUtil = [[VideoUtil alloc] init];
    NSURL *url = [NSURL URLWithString:self.carro.url_video];
    NSLog(@"Ver video %@ - %@", url, self.videoView);
    [videoUtil playUrl:url withView:self.videoView];
    
//    [videoUtil playUrlFullScreen:url controller:self];
}

- (void)exibeCarro {
    [super exibeCarro];

    // Sempre depois de exibir o carro, se o popover está aberto vamos fechá-lo
    if(popoverController) {
        [popoverController dismissPopoverAnimated:YES];
    }
}

#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem*)barButtonItem	forPopoverController: (UIPopoverController*)pc {
    barButtonItem.title = @"Carros";
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.popoverController = pc;
}
- (void)splitViewController: (UISplitViewController*)svc	willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

#pragma mark dealloc
- (void)dealloc {
    [videoUtil release];
    [videoView release];
    [super dealloc];
}

@end
