//
//  ViewController.m
//  ExemploBlocos
//
//  Created by Ricardo Lecheta on 9/1/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize btn3;

- (void)exemploSimples {
   void (^imprimirHora)(void) = ^ {
        NSDate *date = [NSDate date];
        NSLog(@"Data: %@", date);
    };
    
    imprimirHora();
}

- (void)exemploSimplesParametros {
    int (^soma)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    int resultado = soma(3,4);
    NSLog(@"Soma %d", resultado);
}

- (void)exemploFuncao {
    int (^soma)(int, int) = ^(int a, int b) {
        return a + b;
    };
    
    [self metododComParametroBloco:soma];
    
    [self metododComParametroBloco:^(int a, int b) {
        return a + b;
    }];
}

- (void) metododComParametroBloco:(int (^)(int, int))soma {
    int resultado = soma(3,4);
    NSLog(@"Soma passada por função %d", resultado);
}

- (void)exemploAnimacao {
    [UIView animateWithDuration:2.0 animations:^{
        NSLog(@"%@", [btn3 description]);
        if(btn3.alpha == 1) {
            btn3.alpha = 0;
        } else {
            btn3.alpha = 1;
        }
        btn3.frame = CGRectMake(btn3.frame.origin.x*2, btn3.frame.origin.y, btn3.frame.size.width, btn3.frame.size.height);
    }];
}

- (void)dealloc {
    [btn3 release];

    [super dealloc];
}

@end
