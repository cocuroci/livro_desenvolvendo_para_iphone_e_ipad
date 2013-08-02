//
//  VideoViewController.h
//  Carros
//
//  Created by André Cocuroci on 01/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carro.h"
#import "VideoUtil.h"

@interface VideoViewController : UIViewController

@property (retain, nonatomic) VideoUtil *videoUtil;
@property (retain, nonatomic) Carro *carro;
@property (retain, nonatomic) IBOutlet UIWebView *webView;

- (void)videoFim;

@end
