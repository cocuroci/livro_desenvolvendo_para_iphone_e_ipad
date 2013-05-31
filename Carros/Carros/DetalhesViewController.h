//
//  DetalhesViewController.h
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Carro.h"

@interface DetalhesViewController : UIViewController

@property (nonatomic, retain) Carro *carro;
@property (nonatomic, retain) IBOutlet UIImageView *img;
@property (nonatomic, retain) IBOutlet UITextView *tDesc;

@end
