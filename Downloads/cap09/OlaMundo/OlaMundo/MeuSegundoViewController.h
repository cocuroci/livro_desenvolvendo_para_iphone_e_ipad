//
//  MeuSegundoViewController.h
//  OlaMundo
//
//  Created by Ricardo Lecheta on 9/9/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuSegundoViewController : UIViewController
{
    IBOutlet UILabel *label;
    NSString *msg;
}
@property (nonatomic, retain) NSString *msg;
- (IBAction)voltar;
@end
