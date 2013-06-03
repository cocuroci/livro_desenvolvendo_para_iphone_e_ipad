//
//  XMLCarroParser.m
//  Carros
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "XMLCarroParser.h"

@implementation XMLCarroParser
@synthesize carros;


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"carros"])
    {
        // tag <carros> encontrada, cria a lista de carros
        self.carros = [[NSMutableArray alloc] init];
    } else if([elementName isEqualToString:@"carro"])
    {
        //tag <carro> encontrada, cria novo objeto carro
        carro = [[Carro alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"carros"])
    {
        //tag de fim </carros> encontrada. Significa que terminou o XML
        return;
    } else if([elementName isEqualToString:@"carro"])
    {
        //fim da tag </carro>. Então aproveita para inserir o novo carro no array
        [self.carros addObject:carro];
        
        //Depois de inserir o carro no array, podemos liberar a memória, pois o array fez o retain
        [carro release];
        carro = nil;
    } else
    {
        //se não é tag <carro>, pode ser as tags <nome>, <desc> etc.
        //copia os valores do xml para o objeto carro
        //se existirem tags com o mesmo nome da @propertuy do Carro, o valor será copiado
        if(tempString != nil && carro != nil)
        {
            [carro setValue:tempString forKey:elementName];
        }
        
        [tempString release];
        tempString = nil;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    //novos caracteres foram encontrados no xml. Então cria a string e faz o trim
    NSString *s = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(!tempString)
    {
        tempString = [[NSMutableString alloc] init];
    }
    
    [tempString appendString:s];
}

@end
