//
//  DownloadImageView.h
//  Carros
//
//  Created by André Cocuroci on 04/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DownloadImageView : UIImageView
{
    NSString *url;
    UIActivityIndicatorView *progress;
    NSOperationQueue *queue;
}

@property (nonatomic, copy) NSString *url;

@end
