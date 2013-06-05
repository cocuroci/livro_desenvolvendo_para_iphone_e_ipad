//
//  Carro.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Carro : NSObject {
    // id do banco de dados
    int _id;
    // tipo: clássico, esportivo, luxo
    NSString *tipo;

    NSString *nome;
    NSString *desc;
    NSString *url_foto;
    NSString *url_info;
    NSString *url_video;
    NSString *latitude;
    NSString *longitude;
}

@property int _id;
@property (nonatomic, retain) NSString *tipo;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *desc;
@property (nonatomic, retain) NSString *url_foto;
@property (nonatomic, retain) NSString *url_info;
@property (nonatomic, retain) NSString *url_video;
@property (nonatomic, retain) NSString *latitude;
@property (nonatomic, retain) NSString *longitude;

@end
