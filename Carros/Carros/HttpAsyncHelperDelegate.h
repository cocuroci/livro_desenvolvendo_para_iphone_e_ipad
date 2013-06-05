//
//  HttpAsyncHelperDelegate.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HttpAsyncHelperDelegate <NSObject>

@required
//ok
-(void)requestEndWithData:(NSData *)data;
//erro
-(void)requestEndWithError:(NSError *)error;

@end
