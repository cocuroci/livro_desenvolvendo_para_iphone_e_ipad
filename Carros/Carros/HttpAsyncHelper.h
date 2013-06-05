//
//  HttpAsyncHelper.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpAsyncHelperDelegate.h"

@interface HttpAsyncHelper : NSObject <NSURLConnectionDataDelegate>
{
    NSMutableData *retornoHttp;
    id <HttpAsyncHelperDelegate> delegate;
}

@property (retain) id delegate;

-(void) doGet:(NSString *)url;

@end
