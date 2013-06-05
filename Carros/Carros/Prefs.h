//
//  Prefs.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Prefs : NSObject

+(NSString *)getFilePath:(NSString *)chave;
+(void)setString:(NSString *)valor chave:(NSString *)chave;
+(NSString *)getString:(NSString *)chave;
+(void)setInteger:(NSInteger)valor chave:(NSString *)chave;
+(NSInteger)getInteger:(NSString *)chave;

@end