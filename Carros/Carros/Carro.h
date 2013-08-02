//
//  Carro.h
//  Carros
//
//  Created by Ricardo Lecheta on 10/1/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

/*
 Gerado automaticamente pelo wizard
 
 > New > File > iOS > Core Data > Managed Object Class.
 
 */
@interface Carro : NSManagedObject

@property (nonatomic, retain) NSString * tipo;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * url_info;
@property (nonatomic, retain) NSString * url_foto;
@property (nonatomic, retain) NSString * url_video;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;
@property (nonatomic, retain) NSDate * timestamp;

@end
