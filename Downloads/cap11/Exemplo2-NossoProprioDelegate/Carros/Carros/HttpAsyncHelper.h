//
//  HttpHelper.h
//  Carros
//
//  Created by Ricardo Lecheta on 5/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpAsyncHelperDelegate.h"

@interface HttpAsyncHelper : NSObject <NSURLConnectionDataDelegate>
{
    // Retorno do HTTP
    NSMutableData *retornoHttp;
    id <HttpAsyncHelperDelegate> delegate;
}
@property (strong) id delegate;
- (void) doGet:(NSString *) url;
@end
