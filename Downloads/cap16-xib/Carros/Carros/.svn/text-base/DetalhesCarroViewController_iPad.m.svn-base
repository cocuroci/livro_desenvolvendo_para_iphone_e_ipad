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
@synthesize toolBar;

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
    
    // Vai ficar na Vertical, então adiciona o botão na ToolBar
    NSMutableArray *items = [[toolBar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [toolBar setItems:items animated:YES];
    [items release];
}
- (void)splitViewController: (UISplitViewController*)svc	willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    
    NSMutableArray *items = [[toolBar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [toolBar setItems:items animated:YES];
    [items release];
}

#pragma mark dealloc
- (void)dealloc {
    [videoUtil release];
    [videoView release];
    [super dealloc];
}

@end
