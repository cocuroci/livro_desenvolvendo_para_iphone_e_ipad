//
//  CarroService.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "CarroService.h"
#import "Carro.h"
#import "XMLCarroParser.h"

@implementation CarroService

+(NSMutableArray *)getCarros
{
    NSMutableArray *carros = [[[NSMutableArray alloc] init] autorelease];
    
    for(int i = 0; i < 20; i++)
    {
        Carro *c = [[Carro alloc] init];
        c.nome = [NSString stringWithFormat:@"Carro %d",i];
        c.desc = [NSString stringWithFormat:@"Desc Carro %d",i];
        c.url_foto = @"ferrari_ff.png";
        c.url_info = @"http://www.google.com.br";
        [carros addObject:c];
        [c release];
    }
    
    return carros;
}

+(NSMutableArray *)getCarroByTipo:(NSString *)tipo
{
    //cria o nome do arquivo
    NSString *s = [[NSString alloc] initWithFormat:@"carros_%@", tipo];
    NSString *path = [[NSBundle mainBundle] pathForResource:s ofType:@"xml"];
    
    //faz a leitura do arquivo local e retorna um NSData
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    if(data.length == 0)
    {
        return nil;
    }
    
    //chama o metodo que sabe converser o NSData no array de carros;
    NSMutableArray *carros = [self parserXML_SAX:data];
    return carros;
}

+(NSMutableArray *)parserXML_SAX:(NSData *)data
{
    if(!data || [data length] == 0)
    {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
    XMLCarroParser *carrosParser = [XMLCarroParser alloc];
    [xmlParser setDelegate:carrosParser];
    NSMutableArray *carros;
    
    BOOL ok = [xmlParser parse];
    if(ok)
    {
        carros = carrosParser.carros;
    } else
    {
        NSLog(@"Erro no parser");
        return nil;
    }
    
    return carros;
}


@end
