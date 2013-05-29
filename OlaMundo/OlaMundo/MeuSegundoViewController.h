//
//  MeuSegundoViewController.h
//  OlaMundo
//
//  Created by André Cocuroci on 29/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeuSegundoViewController : UIViewController
{
    
    IBOutlet UILabel *label;
    NSString *msg;
}

@property (nonatomic,retain) NSString *msg;

- (IBAction)voltar;

@end
