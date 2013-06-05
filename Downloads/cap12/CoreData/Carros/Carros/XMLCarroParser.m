//
//  XMLCarroParser.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/26/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "XMLCarroParser.h"
#import "Carro.h"
#import "CarroDBCoreData.h"

@implementation XMLCarroParser

@synthesize carros;

#pragma mark NSXMLParserDelegate

// Inicia a tag
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
	attributes:(NSDictionary *)attributeDict {
	if([elementName isEqualToString:@"carros"]) {
        // Tag <carros> encontrada, cria a lista de carros
		self.carros= [[NSMutableArray alloc] init];
	}
	else if([elementName isEqualToString:@"carro"]) {
        // Tag <carro> encontrada, cria um novo objeto Carro
		carro = [CarroDBCoreData newInstance];
    }
}

// Fecha a tag
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
	if([elementName isEqualToString:@"carros"])
	{
		// Tag de fim </carros> encontrada. Significa que terminou o XML.
		return;
	}
	if([elementName isEqualToString:@"carro"]) {
		// Fim da tag </carro>. Então aproveita para inserir o novo carro no array
		[self.carros addObject:carro];
		// Depois de inserir o carro no array, podemos liberar a memória, pois o array fez retain
		[carro release];
		carro = nil;
	} else {
		// Se não é a tag <carro>, pode ser as tags <nome>, <desc>, etc
        // Copia os valores do XML para o objeto Carro
        // Se existirem tags com o mesmo nome da @property do Carro, o valor será copiado
        if(tempString != nil && carro != nil){
			[carro setValue:tempString forKey:elementName];
        }
        // Libera a string depois de utilizar
        [tempString release];
        tempString = nil;
	}
}

// Lendo o conteúdo
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	// Novos caracteres foram encontrados no XML. Então cria a string e faz trim
	NSString *s = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if(!tempString)
	{
        // Se a variável auxiliar não existe, cria uma nova instância
		tempString = [[NSMutableString alloc] init];
	}
    // Faz append na string para copiar o valor recebido para a variável auxiliar
    [tempString appendString:s];
}

#pragma mark dealloc
- (void) dealloc {
	[tempString release];
	[super dealloc];
}
@end