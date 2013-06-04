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
#import "SMXMLDocument.h"
//#import "SBJsonParser.h"

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
    //NSString *path = [[NSBundle mainBundle] pathForResource:s ofType:@"xml"];
    NSString *path = [[NSBundle mainBundle] pathForResource:s ofType:@"json"];
    
    //faz a leitura do arquivo local e retorna um NSData
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    if(data.length == 0)
    {
        return nil;
    }
    
    //chama o metodo que sabe converser o NSData no array de carros;
    //NSMutableArray *carros = [self parserXML_SAX:data];
    //NSMutableArray *carros = [self parserXML_DOM:data];
    NSMutableArray *carros = [self parserJSON:data];
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

+(NSMutableArray *)parserXML_DOM:(NSData *)data
{
    if(!data || [data length] == 0)
    {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    NSError *error;
    SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];
    
    if(error)
    {
        NSLog(@"Error while parsing the document: %@", [error description]);
        return nil;
    }
    
    NSMutableArray *carros = [[NSMutableArray alloc] init];
    
    SMXMLElement *tagCarros = document.root;
    
    for(SMXMLElement *tagCarro in [tagCarros childrenNamed:@"carro"])
    {
        Carro *c    = [[Carro alloc] init];
        c.nome      = [tagCarro valueWithPath:@"nome"];
        c.desc      = [tagCarro valueWithPath:@"desc"];
        c.url_foto  = [tagCarro valueWithPath:@"url_foto"];
        c.url_info  = [tagCarro valueWithPath:@"url_info"];
        c.url_video = [tagCarro valueWithPath:@"url_video"];
        c.latitude  = [tagCarro valueWithPath:@"latitude"];
        c.longitude = [tagCarro valueWithPath:@"longitude"];
        [carros addObject:c];
        [c release];
    }
    
    return carros;
}

+(NSMutableArray *)parserJSON:(NSData *)data
{
    if(!data || [data length] == 0)
    {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    NSMutableArray *carros = [[NSMutableArray alloc] init];
   
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(error)
    {
        NSLog(@"Error parsing json: %@", error);
        return nil;
    }    

    NSArray *jsonCarros = [[json objectForKey:@"carros"] objectForKey:@"carro"];
    
    for(NSDictionary *dicCarro in jsonCarros)
    {
        Carro *c    = [[Carro alloc] init];
        c.nome      = [dicCarro objectForKey:@"nome"];
        c.desc      = [dicCarro objectForKey:@"desc"];
        c.url_foto  = [dicCarro objectForKey:@"url_foto"];
        c.url_info  = [dicCarro objectForKey:@"url_info"];
        c.url_video = [dicCarro objectForKey:@"url_video"];
        c.latitude  = [dicCarro objectForKey:@"latitude"];
        c.longitude = [dicCarro objectForKey:@"longitude"];
        [carros addObject:c];
        [c release];
    }

    
    return carros;
}


@end
