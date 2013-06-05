//
//  DetalhesCarroViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Carro.h"

@interface DetalhesCarroViewController : UIViewController
{
    Carro *carro;
    // Views para vertical e horizontal
    IBOutlet UIView *viewVertical;
    IBOutlet UIView *viewHorizontal;
}

@property (nonatomic, retain) Carro *carro;
@property (nonatomic, retain) IBOutlet UIImageView *img;
@property (nonatomic, retain) IBOutlet UITextView *tDesc;

// Imagem utilizada na horizontal
@property (nonatomic, retain) IBOutlet UIImageView *imgHorizontal;

@end