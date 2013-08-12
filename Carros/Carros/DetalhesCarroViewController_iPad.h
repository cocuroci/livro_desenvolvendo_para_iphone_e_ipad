//
//  DetalhesCarroViewController_iPad.h
//  Carros
//
//  Created by André Cocuroci on 12/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "DetalhesCarroViewController.h"

@interface DetalhesCarroViewController_iPad : DetalhesCarroViewController <UISplitViewControllerDelegate>

@property (nonatomic, retain) IBOutlet UIView *videoView;
@property (nonatomic, retain) UIPopoverController *popController;

@end
