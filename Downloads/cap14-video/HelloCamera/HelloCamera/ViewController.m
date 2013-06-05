//
//  ViewController.m
//  HelloCamera
//
//  Created by Ricardo Lecheta on 10/2/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	// Cria o ImagePicker para buscar a foto na galeria ou tirar uma foto com a câmera
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;

    // Esconde o botão da câmera se ela não estiver disponível
    BOOL cameraDisponivel = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if(! cameraDisponivel) {
        // Esconde o botão da câmera
        btnCamera.hidden = YES;
    }
}

#pragma mark eventos
- (void)tirarFoto:(id)sender {
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;

    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;

    if(iPad) {
        // Exibe o popover
        UIButton *bt = (UIButton *) sender;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        [popover presentPopoverFromRect:[bt bounds] inView:bt permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}
- (void)escolherFoto:(id)sender {
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    BOOL iPad = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad;
    
    if(iPad) {
        // Exibe o popover
        UIButton *bt = (UIButton *) sender;
        UIPopoverController *popover = [[UIPopoverController alloc] initWithContentViewController:imagePicker];
        [popover presentPopoverFromRect:[bt bounds] inView:bt permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    } else {
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
}

#pragma mark rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown;
}

#pragma mark
- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *) Picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	// Cria a imagem com o resultado (foto da câmera ou da galeria)
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark dealloc
- (void)dealloc {
    [imagePicker release];
    [imageView release];
	[btnCamera release];

    [super dealloc];
}


@end
