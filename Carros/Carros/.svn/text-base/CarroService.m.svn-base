//
//  CarroService.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/23/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "CarroService.h"
#import "Carro.h"
#import "XMLCarroParser.h"
#import "SMXMLDocument.h"
#import "SBJson.h"
#import "CarroDBCoreData.h"
#import "HttpHelper.h"

@implementation CarroService

+ (NSMutableArray *) getCarros {
    NSMutableArray *carros = [[[NSMutableArray alloc] init] autorelease];

    for (int i = 0; i < 20; i++) {
        Carro *c = [[Carro alloc] init];

        [c setNome:[NSString stringWithFormat:@"Carro %d", i]];
        [c setDesc:[NSString stringWithFormat:@"Desc Carro %d", i]];
        [c setUrl_foto:@"Ferrari_FF.png"];
        [c setUrl_info:@"http://www.google.com.br"];

        [carros addObject:c];
        
        [c release];
    }

    return carros;
}

+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo {
    // URL
    NSString *url = [NSString stringWithFormat:URL_CARROS, tipo];
    
    // Faz a requisição HTTP
    HttpHelper *http = [[[HttpHelper alloc] init] autorelease];
    
    NSData *data = [http doGet:url];
    
    // Faz o parser do XML
    NSMutableArray *carros = [self parserXML_DOM:data];
    
    return carros;
}

+ (NSMutableArray *)getCarrosByTipo:(NSString *)tipo cache:(BOOL)cache {
	// Array de carros
	NSMutableArray *carros = nil;
	// Busca os carros do banco de dados
	CarroDBCoreData *db = [[CarroDBCoreData alloc] autorelease];
    
	// Se for para buscar de cache, vamos consultar o banco de dados
	if(cache) {
		carros = [db getCarrosTipo:tipo];
	}
	// Se a busca deve ser online, ou se não foi encontrado nada no banco
	if(!carros || carros.count == 0) {
		// Faz a requisição HTTP
		carros = [CarroService getCarrosByTipo:tipo];
        
		// Depois sempre salva os carros no banco de dados
		if(carros) {
			// Deletar os registros antigos
			[db deletarCarrosTipo:tipo];
            
			// Agora vamos salvar cada carro
			for (Carro *c in carros) {
				// Atualiza o tipo para salvar o valor neste coluna
				c.tipo = tipo;
				[db salvar:c];
			}
		}
	}
    
	return carros;
}

+ (NSMutableArray *) parserXML_SAX :(NSData *) data {
    if(!data || [data length]  == 0) {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithData:data];
    
    //NSString *s = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"XML: %@", s);
    
    // Cria o parser dos Carros, e informa o "xmlParser" que ela é o delegate (para receber os eventos de parser)
    XMLCarroParser *carrosParser = [XMLCarroParser alloc];
    [xmlParser setDelegate: carrosParser];
    
    // Inicia o parser com o NSXMLParser, o que vai chamar a classe XMLCarroParser
    BOOL ok = [xmlParser parse];
    
    NSMutableArray * carros;
    
    if(ok) {
        // Fez o parser com sucesso, retorna a lista de carros
        carros = carrosParser.carros;
    } else {
        NSLog(@"Erro no parser");
        return nil;
    }
    
    // Retorna a lista de carros
    return carros;
}

+ (NSMutableArray *) parserXML_DOM :(NSData *) data {
    if(!data || [data length]  == 0) {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }

    // Cria a estrutura "Document" para ler o XML
    NSError *error;
    SMXMLDocument *document = [SMXMLDocument documentWithData:data error:&error];

    // Verifica se aconteceu algum erro ao abrir o XML
    if (error) {
        NSLog(@"Error while parsing the document: %@", error);
        return nil;
    }
    
    NSMutableArray * carros = [[NSMutableArray alloc] init];
    
    // Recupera o document root (raiz)
    SMXMLElement *tagCarros = document.root;
    
    // Percorre todas as tags <carro>
    for (SMXMLElement *tagCarro in [tagCarros childrenNamed:@"carro"]) {

        Carro *c    = [CarroDBCoreData newInstance];
        c.nome      = [tagCarro valueWithPath:@"nome"];
        c.desc      = [tagCarro valueWithPath:@"desc"];
        c.url_info  = [tagCarro valueWithPath:@"url_info"];
        c.url_foto  = [tagCarro valueWithPath:@"url_foto"];
        c.url_video = [tagCarro valueWithPath:@"url_video"];
        c.latitude  = [tagCarro valueWithPath:@"latitude"];
        c.longitude = [tagCarro valueWithPath:@"longitude"];
        
        [carros addObject:c];
        NSLog(@"Carro: [%@]" , c.nome);
        [c release];
    }
    
    // Retorna a lista de carros
    return carros;
}

+ (NSMutableArray *) parserJSON :(NSData *) data {
    
    if(!data || [data length]  == 0) {
        NSLog(@"Nenhum dado encontrado");
        return nil;
    }
    
    // Inicializa o parser de JSON
    SBJsonParser *jsonParser = [SBJsonParser new];
    
    //NSError* error;
    //NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    // Carrega o NSData em um NSDictionary
    NSDictionary *json = (NSDictionary *) [jsonParser objectWithData:data];
    
    NSMutableArray * carros = [[NSMutableArray alloc] init];
    
    // Dictionary para todos os carros
    NSArray *jsonCarros = [[ json objectForKey:@"carros"] objectForKey:@"carro"];

    // Para cada carro
    for (NSDictionary *dictCarro in jsonCarros) {
        // O valor de cada carro é lido de um NSDictionary
        Carro *c    = [CarroDBCoreData newInstance];
        c.nome      = [dictCarro objectForKey:@"nome"];
        c.desc      = [dictCarro objectForKey:@"desc"];
        c.url_info  = [dictCarro objectForKey:@"url_info"];
        c.url_foto  = [dictCarro objectForKey:@"url_foto"];
        c.url_video = [dictCarro objectForKey:@"url_video"];
        c.latitude  = [dictCarro objectForKey:@"latitude"];
        c.longitude = [dictCarro objectForKey:@"longitude"];
        
        [carros addObject:c];
        NSLog(@"Carro: [%@]" , c.nome);
        [c release];

    }
    // Retorna a lista de carros
    return carros;
}

@end