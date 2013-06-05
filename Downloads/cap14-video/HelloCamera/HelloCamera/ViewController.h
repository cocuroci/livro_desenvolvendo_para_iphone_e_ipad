//
//  ViewController.h
//  HelloCamera
//
//  Created by Ricardo Lecheta on 10/2/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    UIImagePickerController *imagePicker;

    IBOutlet UIImageView *imageView;
    IBOutlet UIButton *btnCamera;
}

- (IBAction) tirarFoto:(id)sender;

- (IBAction) escolherFoto:(id)sender;
@end