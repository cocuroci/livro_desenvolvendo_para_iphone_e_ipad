//
//  ViewLegal.m
//  HelloQuartz2D
//
//  Created by Ricardo Lecheta on 10/18/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewLegal.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewLegal

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Código de inicialização
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self desenhaFundoBranco];
    [self exemplo1_Linha];
    [self exemplo2_Quadrado];
    [self exemplo3_Path];
    [self exemplo4_circulo];
    [self exemplo5_imagem];
}

// Linha azul na diagonal
- (void) desenhaFundoBranco {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Branco
    UIColor *color = [UIColor whiteColor];

    // Cor de preenchimento
    CGContextSetFillColorWithColor(context, color.CGColor);

    // Quadrado preeenchido
    CGContextFillRect (context, CGRectMake (0, 0, self.frame.size.width, self.frame.size.height ));
}

// Linha azul na diagonal
- (void) exemplo1_Linha {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    // Azul
    UIColor *color = [UIColor blueColor];

    // Cor da linha
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    // Posiciona no 0,0
    CGContextMoveToPoint(context, 0, 0);
    
    // Cria uma linha até o final da tela na diagonal
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);

    // Desenha a linha
    CGContextStrokePath(context);
}

// Quadrado
- (void) exemplo2_Quadrado {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
   
    // Azul
    UIColor *color = [UIColor blueColor];
    
    // Cor da linha
    CGContextSetStrokeColorWithColor(context, color.CGColor);

    // Quadrado
    CGContextAddRect(context, CGRectMake (10, 190, 100, 100 ));

    // Desenha
    CGContextStrokePath(context);
}

// Path
- (void) exemplo3_Path {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    // Azul
    UIColor *color = [UIColor blueColor];
    
    // Cor da linha
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    
    // Posiciona no 0,0
    CGContextMoveToPoint(context, 10, 10);
    
    // Linha para baixo
    CGContextAddLineToPoint(context, 10, 100);
    
    // Linha para direita
    CGContextAddLineToPoint(context, 100, 100);
    
    // Linha para cima
    CGContextAddLineToPoint(context, 100, 10);
    
    // Linha para esquerda
    CGContextAddLineToPoint(context, 10, 10);
    
    // Cor de preenchimento
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);

    // Desenha
    CGContextStrokePath(context);
}

// Círculo
- (void) exemplo4_circulo {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    // Azul
    UIColor *color = [UIColor blueColor];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    int x = self.frame.size.width - 110;

    // Círculo
    CGContextAddEllipseInRect(context, CGRectMake(x,10,100,100));
    CGContextStrokePath(context);
    
    // Círculo preenchido
    CGContextFillEllipseInRect(context, CGRectMake(x,120,100,100));
}

// Imagem
- (void) exemplo5_imagem {
    
    // Cria a imagem
    UIImage *img = [UIImage imageNamed:@"mclaren.png"];

    // Desenha na posição 10/10
//    CGPoint imagePoint = CGPointMake(10, 10);
//    [img drawAtPoint:imagePoint];
    
    CGRect imageRect = CGRectMake(10, self.frame.size.height - 100, 200, 85);
    [img drawInRect:imageRect];
    
}

@end
