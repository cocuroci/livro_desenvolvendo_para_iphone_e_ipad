//
//  HttpHelper.h
//  Carros
//
//  Created by André Cocuroci on 05/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject

-(NSData *)doGet:(NSString *)url;

@end
