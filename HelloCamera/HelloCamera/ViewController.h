//
//  ViewController.h
//  HelloCamera
//
//  Created by André Cocuroci on 02/08/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIImagePickerController *imagePicker;
    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *btCamera;
}

- (IBAction)tirarFoto:(id)sender;
- (IBAction)escolherForo:(id)sender;

@end
