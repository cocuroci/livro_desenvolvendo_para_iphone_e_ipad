//
//  Prefs.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/30/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "Prefs.h"

@implementation Prefs

+ (void) setString:(NSString *)valor chave:(NSString *)chave {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setValue:valor forKey:chave];
    [prefs synchronize];
}

+ (NSString *) getString:(NSString *)chave {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *valor = [prefs stringForKey:chave];
    return valor;
}

+ (void) setInteger:(NSInteger )valor chave:(NSString * )chave {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:valor forKey:chave];
    [prefs synchronize];
}

+ (NSInteger) getInteger:(NSString *)chave {
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger i = [prefs integerForKey:chave];
    return i;
}

@end