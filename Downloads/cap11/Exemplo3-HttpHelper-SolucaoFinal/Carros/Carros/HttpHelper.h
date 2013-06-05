//
//  HttpHelper.h
//  Carros
//
//  Created by Ricardo Lecheta on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpHelper : NSObject
{

}
- (NSData *) doGet:(NSString *) url;
@end
