//
//  MeuPrimeiroViewController.h
//  OlaMundo
//
//  Created by André Cocuroci on 29/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuPrimeiroViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UILabel *meuPrimeiroLabel;
    IBOutlet UITextField *meuPrimeiroTextField;
    IBOutlet UITextField *meuSegundoTextField;
    IBOutlet UIImageView *imageView;
}

@property (nonatomic,strong) UITextField *lastFildSelected;

-(IBAction)olaMundo;
-(IBAction)beginEditing:(id)sender;
-(IBAction)sliderValueChanged:(id)sender;

@end
