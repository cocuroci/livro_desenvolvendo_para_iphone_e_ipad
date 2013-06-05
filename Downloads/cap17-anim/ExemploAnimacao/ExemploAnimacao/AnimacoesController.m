//
//  AnimacoesController.m
//  ExemploAnimacao
//
//  Created by Ricardo Lecheta on 2/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimacoesController.h"
#define degreesToRadians(x) (M_PI * x / 180.0)

@implementation AnimacoesController
@synthesize img, picker, array;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.array = [[NSArray alloc] initWithObjects:
                  @"Alpha",
                  @"Mover",
                  @"Mover - Transform",
                  @"Redimensionar",
                  @"Redimensionar - Transform",
                  @"Girar 1 - Transformação",
                  @"Animação com Blocks 1",
                  @"Animação com Blocks 2",
                  nil];
    
    CGRect rect = img.frame;
    int x = rect.origin.x;      // Coordenada x
    int y = rect.origin.y;      // Coordenada y
    int w = rect.size.width;    // Largura
    int h = rect.size.height;   // Altura
    NSLog(@"x/y = %d/%d, w/h:%d/%d", x, y, w, h);
    
    NSLog(@"rect: %@", NSStringFromCGRect(rect));
    
    NSLog(@"frame %@, bounds %@", NSStringFromCGRect(img.frame), NSStringFromCGRect(img.bounds));
}

#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [array count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [array objectAtIndex:row];
}

#pragma mark Actions
- (IBAction) animar {
    NSInteger idx = [picker selectedRowInComponent:0];
    NSString *s = [array objectAtIndex:idx];
    NSLog(@"%@",s);
    if([@"Alpha" isEqualToString:s]) {
        [self alpha];
    }else if([@"Mover" isEqualToString:s]) {
        [self mover1];
    }else if([@"Mover - Transform" isEqualToString:s]) {
        [self mover2];
    }else if([@"Redimensionar" isEqualToString:s]) {
        [self redimensionar1];
    }else if([@"Redimensionar - Transform" isEqualToString:s]) {
        [self redimensionar2];
    }else if([@"Girar 1 - Transformação" isEqualToString:s]) {
        [self girar1];
    }else if([@"Animação com Blocks 1" isEqualToString:s]) {
        [self mover3];
    }else if([@"Animação com Blocks 2" isEqualToString:s]) {
        [self girar2];
    }else {
        NSLog(@"Nenhum valor %@", s);
    }
}

#pragma mark Animações

- (void) alpha {
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 1 segundo
    [UIView setAnimationDuration:5];
    [UIView setAnimationDelegate:self];

    if (img.alpha == 1) {
        // Está visível, vamos deixar transparente
        img.alpha = 0;
    } else {
        // Está visível, vamos deixar visível
        img.alpha = 1;
    }

    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) mover1 {
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 1 segundo
    [UIView setAnimationDuration:1];

    // x original conforme a imagem foi inserida no xib
    int xOriginal = 126;

    CGRect rect = img.frame;
    int x = rect.origin.x;
    int y = rect.origin.y;
    int w = rect.size.width;
    int h = rect.size.height;
    
    // Se ainda não moveu
    if(x == xOriginal) {
        // Vai para a direita
        img.frame = CGRectMake(x+100, y, w, h);
    } else {
        // Volta para esquerda (x original)
        img.frame = CGRectMake(x-100, y, w, h);
    }

    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) mover2 {
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 1 segundo
    [UIView setAnimationDuration:1];

    // Deslocamento atual do eixo x
    int tx = img.transform.tx;
    if(tx == 0) {
        // Move a imagem para a direita
        img.transform = CGAffineTransformMakeTranslation (100, 0);
    } else {
        // Zera a transformação
        img.transform = CGAffineTransformIdentity;
    }

    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) mover3 {
    // Demonstra como usar blocks
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
        // Deslocamento atual do eixo x
        int tx = img.transform.tx;
        if(tx == 0) {
            // Move a imagem para a direita
            img.transform = CGAffineTransformMakeTranslation (100, 0);
        } else {
            // Zera a transformação
            img.transform = CGAffineTransformIdentity;
        }
    } completion:nil];
}

- (void) redimensionar1 {
    NSLog(@"redimensionar");
    
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 3 segundos
    [UIView setAnimationDuration:1];
    
    NSLog(@"w/h %f/%f", img.bounds.size.width, img.bounds.size.height);

    if(img.bounds.size.width == 69) {
        img.bounds = CGRectMake(img.bounds.origin.x, img.bounds.origin.y, img.bounds.size.width * 2, img.bounds.size.height * 2);
    } else {
        img.bounds = CGRectMake(img.bounds.origin.x, img.bounds.origin.y, 69, 77);
    }

    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) redimensionar2 {
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 3 segundos
    [UIView setAnimationDuration:1];
    
    // Deslocamento atual do eixo Y
    int ty = img.transform.a;
    NSLog(@"ty %d", ty);

    // 1 == 100%
    // 2 = 200%
    if(ty == 1) {
        // Aumenta a imagem para 200%
        img.transform = CGAffineTransformMakeScale(2,2);
    } else {
        img.transform = CGAffineTransformIdentity;
    }
    
    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) girar1 {
    // Inicia a animação
    [UIView beginAnimations:nil context:NULL];
    // Durante 3 segundos
    [UIView setAnimationDuration:1];
    
    // Deslocamento atual do eixo Y
    int ty = img.transform.d;
    NSLog(@"pi %d", ty);
    if (ty == 1) {
        img.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
    } else {
        img.transform = CGAffineTransformIdentity;
    }

    // Finaliza a animação
    [UIView commitAnimations];
}

- (void) girar2 {
    if(img.alpha == 0) {
        // Zera a transformação
        img.transform = CGAffineTransformIdentity;
        img.alpha = 1;
    } else {
        // Demonstra uma animação de rotação, e no final deixa a imagem transparente
        [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationCurveEaseOut animations:^{
            // Deslocamento atual do eixo Y
            int ty = img.transform.d;
            NSLog(@"pi %d", ty);
            if (ty == 1) {
                img.transform = CGAffineTransformMakeRotation(degreesToRadians(180));
            } else {
                img.transform = CGAffineTransformIdentity;
            }
            
        } completion: ^(BOOL fim){
            // No final da animaçao de girar
            [UIView animateWithDuration:1 animations:^{
                if (img.alpha == 1) {
                    // Está visível, vamos deixar transparente
                    img.alpha = 0;
                } else {
                    // Está visível, vamos deixar visível
                    img.alpha = 1;
                }
            }];
        }];
    }
}

#pragma mark AnimationDelegate - monitorar o início e fim da animação
- (void)animationWillStart:(NSString *)animationID context:(void *)context {
    NSLog(@"Animação iniciada.");
}

- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    NSLog(@"Animação Finalizada.");
}

- (void)dealloc {
    [img release];
    [picker release];
    [array release];
    
    [super dealloc];
}

@end
