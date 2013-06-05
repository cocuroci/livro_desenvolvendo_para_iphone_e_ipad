//
//  HttpAsyncHelper.m
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "HttpAsyncHelper.h"

@implementation HttpAsyncHelper
@synthesize delegate;

-(void)doGet:(NSString *)url
{
    retornoHttp = [[NSMutableData data] retain];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - http

//recebeu uma resposta do servidor
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [retornoHttp setLength:0];
}

//recebeu dados, então vamos adicionar ns NSData
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [retornoHttp appendData:data];
}

//ocorreu erro
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [delegate requestEndWithError:error];
}

//terminou a requisição
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [delegate requestEndWithData:retornoHttp];
}

#pragma mark - dealloc
-(void)dealloc
{
    [retornoHttp release];
    [super dealloc];
}


@end
