//
//  XMLCarroParser.h
//  Carros
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"

@interface XMLCarroParser : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *carros;
    NSMutableString *tempString;
    Carro *carro;
}

@property (nonatomic,retain) NSMutableArray *carros;

@end
