//
//  HttpHelper.m
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "HttpHelper.h"

@implementation HttpHelper

-(NSData *)doGet:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:30];
    
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    
    return data;
}

@end
