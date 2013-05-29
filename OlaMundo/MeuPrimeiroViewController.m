//
//  MeuPrimeiroViewController.m
//  OlaMundo
//
//  Created by André Cocuroci on 29/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "MeuPrimeiroViewController.h"

@implementation MeuPrimeiroViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    meuPrimeiroLabel.text = @"Tela iniciada com sucesso!";
    
    meuPrimeiroTextField.delegate = self;
    meuSegundoTextField.delegate = self;
    
    UIImage *image = [UIImage imageNamed:@"ferrari_ff.png"];
    imageView.image = image;
    
    [image release];
}

-(IBAction)olaMundo
{
    //NSLog(@"Olá mundo");
    //meuPrimeiroLabel.text = @"Olá mundo iPhone!";
    
    if([meuPrimeiroTextField.text isEqualToString:@""] || [meuSegundoTextField.text isEqualToString:@""])
    {
        UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Erro" message:@"Digite todos os campos" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [a show];
        [a release];
        return;
    }
    
    
    NSString *s = @"Olá";    
    s = [s stringByAppendingFormat:@" %@ %@", meuPrimeiroTextField.text, meuSegundoTextField.text];
    
    meuPrimeiroLabel.text = s;
    
    [self hideFields];
}

- (IBAction)beginEditing:(id)sender
{
    self.lastFildSelected = sender;
}

- (IBAction)sliderValueChanged:(id)sender
{
    UISlider *slider = sender;
    imageView.alpha = [slider value];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self hideFields];
}

-(void)hideFields
{
    NSLog(@"text field: %@", self.lastFildSelected);
    [self.lastFildSelected resignFirstResponder];
}

-(void)dealloc
{
    [meuPrimeiroLabel release];
    [meuPrimeiroTextField release];
    [meuSegundoTextField release];
    [imageView release];
    [super dealloc];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == meuPrimeiroTextField)
    {
        [meuSegundoTextField becomeFirstResponder];
        return YES;
    }
    else if(textField == meuSegundoTextField)
    {
        [self olaMundo];
        return YES;
    }
    
    return NO;
}

@end
