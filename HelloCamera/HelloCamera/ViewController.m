//
//  ViewController.m
//  HelloCamera
//
//  Created by André Cocuroci on 02/08/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    BOOL cameraDisponivel = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    
    if (!cameraDisponivel) {
        btCamera.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tirarFoto:(id)sender
{
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        UIButton *bt = (UIButton *)sender;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        
        [popover presentPopoverFromRect:[bt bounds] inView:bt permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {    
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}

- (void)escolherForo:(id)sender
{
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        UIButton *bt = (UIButton *)sender;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        
        [popover presentPopoverFromRect:[bt bounds] inView:bt permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"Cancelado");
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

@end
