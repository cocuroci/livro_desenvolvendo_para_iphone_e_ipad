//
//  Prefs.m
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "Prefs.h"

@implementation Prefs

+(NSString *)getFilePath:(NSString *)chave
{
    // Cria o caminho com o arquivo
     NSString *arquivo = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/%@.txt", chave]];
    NSLog(@"Caminho do arquivo: %@", arquivo);
    return arquivo;
}

+(void)setString:(NSString *)valor chave:(NSString *)chave
{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    [prefs setValue:valor forKey:chave];
//    [prefs synchronize];
    
    // Cria o caminho com o arquivo
    NSString *arquivo = [Prefs getFilePath:chave];
    // Converte o valor para NSData
    NSData *data = [valor dataUsingEncoding:NSUTF8StringEncoding];
    // Escreve no arquivo
    [data writeToFile:arquivo atomically:YES];
}

+(NSString *)getString:(NSString *)chave
{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    return [prefs stringForKey:chave];
    
    // Cria o caminho com o arquivo
    NSString *arquivo = [Prefs getFilePath:chave];
    NSData *data = [NSData dataWithContentsOfFile:arquivo];
    return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
}

+(void)setInteger:(NSInteger)valor chave:(NSString *)chave
{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    [prefs setInteger:valor forKey:chave];
//    [prefs synchronize];
    
    // Converte o número para string
    NSString *valorString = [NSString stringWithFormat:@"%d", valor];
    [Prefs setString:valorString chave:chave];
}

+(NSInteger)getInteger:(NSString *)chave
{
//    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
//    return [prefs integerForKey:chave];
    
    NSString *valorString = [Prefs getString:chave];
    return [valorString intValue];
}

@end
