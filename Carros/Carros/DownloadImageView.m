//
//  DownloadImageView.m
//  Carros
//
//  Created by André Cocuroci on 04/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "DownloadImageView.h"

@implementation DownloadImageView
@synthesize url;
#define LOG_ON NO
#define CACHE_ON YES

-(id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super initWithCoder:aDecoder])
    {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    progress.center = [self convertPoint:self.center fromView:self.superview];
}

-(void)setUrl:(NSString *)urlParam
{
    if([urlParam length] == 0)
    {
        [self.url release];
        self.url = nil;
        self.image = nil;
    } else if (urlParam != self.url)
    {
        [self.url release];
        url = [urlParam copy];
        self.image = nil;
        
        if(!queue)
        {
            queue = [[NSOperationQueue alloc] init];
        }
        
        [queue cancelAllOperations];
        
        [progress startAnimating];
        
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImg) object:nil];
        [queue addOperation:operation];
        [operation release];
    }
}

-(void)downloadImg
{
    NSString *file = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    file = [@"/Documents/" stringByAppendingString:file];
    file = [[NSHomeDirectory() stringByAppendingString:[NSString stringWithString:file]] retain];
    
    if(LOG_ON && CACHE_ON)
    {
        NSLog(@"Arquivo img %@", file);
    }
    
    if(CACHE_ON && [[NSFileManager defaultManager] fileExistsAtPath:file])
    {
        NSData *data = [NSData dataWithContentsOfFile:file];
        
        if(data)
        {
            if(LOG_ON)
            {
                NSLog(@"Encontrado no cache %@", url);
            }
            
            UIImage *img = [UIImage imageWithData:data];
            [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
            return;
        }
    }
    
    if(LOG_ON)
    {
        NSLog(@"Download URL %@", url);
    }
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *img = [UIImage imageWithData:data];
    
    if(CACHE_ON)
    {
        NSLog(@"Salvo no cache URL %@", url);
        [data writeToFile:file atomically:YES];
    }
    
    [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
    
    [img release];
}

-(void)showImg:(UIImage *)imagem
{
    self.image = imagem;
    
    [progress stopAnimating];
}

//-(void)dealloc
//{
//    [queue release];
//    [url release];
//    [progress removeFromSuperview];
//    [progress release];
//    [super dealloc];
//}

@end
