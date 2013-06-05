//
//  ViewDesenho.m
//  HelloQuartz2D
//
//  Created by Ricardo Lecheta on 10/19/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewTouch.h"

@implementation ViewTouch

@synthesize x, y;

- (void)drawRect:(CGRect)rect
{
    [self desenhaFundoBranco];

    [self desenhaCirculo];
}

// Touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    
    // Lê a posicão do touch
    CGPoint point = [touch locationInView:self];
    self.x = point.x;
    self.y = point.y;
    
    // Redesenha a view
    [self setNeedsDisplay];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[touches allObjects] objectAtIndex:0];
    
    // Lê a posicão do touch
    CGPoint point = [touch locationInView:self];
    self.x = point.x;
    self.y = point.y;
    
    // Redesenha a view
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {

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

// Círculo
- (void) desenhaCirculo {
    // Recupera o contexto
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    // Azul
    UIColor *color = [UIColor blueColor];
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);

    // Círculo preenchido
    CGContextFillEllipseInRect(context, CGRectMake(self.x - 25, self.y - 25 , 50 , 50));
}

@end
