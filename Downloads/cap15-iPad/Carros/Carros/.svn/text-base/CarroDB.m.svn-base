//
//  CarroDB.m
//  Carros
//
//  Created by Ricardo Lecheta on 9/30/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "CarroDB.h"
#import "Carro.h"

@implementation CarroDB

// Retorna o SQL para criar o carro
- (NSString *)getSQLCreate {
    NSString *sql = @"create table if not exists carro (_id integer primary key autoincrement,nome text, desc text, url_foto text,url_info text,url_video text, latitude text, longitude text, tipo text);";
    return sql;
}

// Salva um novo carro ou atualiza um já existente pelo _id
- (void) salvar:(Carro *)carro {
    char *sql = "insert or replace into carro (_id,nome,desc,url_foto,url_info,url_video,latitude,longitude, tipo) VALUES (?,?,?,?,?,?,?,?,?);";
    sqlite3_stmt *stmt;
    int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil) ;
    if (resultado == SQLITE_OK) {
        // Se for nulo insere, senão atualiza
        if(carro._id > 0) {
            // Informa o id para fazer update
            sqlite3_bind_int(stmt, 1, carro._id);
        }
        sqlite3_bind_text(stmt, 2, [carro.nome UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 3, [carro.desc UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 4, [carro.url_foto UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 5, [carro.url_info UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 6, [carro.url_video UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 7, [carro.latitude UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 8, [carro.longitude UTF8String], -1, nil);
        sqlite3_bind_text(stmt, 9, [carro.tipo UTF8String], -1, nil);
        // Executa o SQL
        resultado = sqlite3_step(stmt);
        if(resultado == SQLITE_DONE) {
            // Inserido com sucesso
        }
        sqlite3_finalize(stmt);
    } else {
        NSLog(@"Erro ao inserir carro %d", resultado);
        return;
    }
}

// Seleciona todos os carros do tipo informando
- (NSMutableArray *) getCarrosTipo:(NSString *)tipo {
	// Array que vai armazenar a lista de carros
	NSMutableArray* carros = [[[NSMutableArray alloc] init] autorelease];
    // SQL para selecionar todos os carros pelo tipo informado
    NSString *query = @"select _id,nome,desc,url_foto,url_info,url_video,latitude,longitude,tipo from carro where tipo = ? order by _id";
    sqlite3_stmt *stmt;
    // Cria o statement
    int resultado = sqlite3_prepare_v2( bancoDeDados, [query UTF8String],-1, &stmt, nil);
	if (resultado == SQLITE_OK) {
    	// Informa o parâmetro tipo (tipo = ?)
    	sqlite3_bind_text(stmt, 1, [tipo UTF8String],-1, nil );
    	// Enquanto existir carros
    	while (sqlite3_step(stmt) == SQLITE_ROW) {
    		// Cria o carro para inserir na lista
    		Carro *c = [Carro alloc];
    		
            // Faz a leitura de cada coluna
    		c._id			= sqlite3_column_int(stmt, 0);
    		
            char *s	= (char *)sqlite3_column_text(stmt, 1);
    		c.nome		= s != nil ? [NSString stringWithUTF8String:s] : nil;
    		
            s	= (char *)sqlite3_column_text(stmt, 2);
    		c.desc		= s != nil ? [NSString stringWithUTF8String:s] : nil;
    		
            s	= (char *)sqlite3_column_text(stmt, 3);
    		c.url_foto		= s != nil ? [NSString stringWithUTF8String:s] : nil;
    		
            s	= (char *)sqlite3_column_text(stmt, 4);
    		c.url_info		= s != nil ? [NSString stringWithUTF8String:s] : nil;
            
            s	= (char *)sqlite3_column_text(stmt, 5);
    		c.url_video		= s != nil ? [NSString stringWithUTF8String:s] : nil;
            
            s	= (char *)sqlite3_column_text(stmt, 6);
    		c.latitude		= s != nil ? [NSString stringWithUTF8String:s] : nil;
            
            s	= (char *)sqlite3_column_text(stmt, 7);
    		c.longitude		= s != nil ? [NSString stringWithUTF8String:s] : nil;
            
    		s	= (char *)sqlite3_column_text(stmt, 8);
    		c.tipo		= s != nil ? [NSString stringWithUTF8String:s] : nil;
            
    		// Adiciona no array
    		[carros addObject:c];
            
    		// Faz release do carro, pois o array fez retain
    		[c release];
    	}
    	// Finaliza o cursor
    	sqlite3_finalize(stmt);
    }
	return carros;
}

// Deleta o carro
- (void) deletar:(Carro *)carro {
    char *sql = "delete from carro where _id=?";
	sqlite3_stmt *stmt;
	int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil) ;
    if (resultado == SQLITE_OK) {
    	// Informe o id para deletar
        sqlite3_bind_int(stmt, 1, carro._id);
        // Executa o SQL
        resultado = sqlite3_step(stmt);
        if (resultado == SQLITE_DONE){
            // Deletado com sucesso
        }
        sqlite3_finalize(stmt);
    }
}

// Deleta todos os carros do tipo informando
- (void) deletarCarrosTipo:(NSString *)tipo {
    char *sql = "delete from carro where tipo=?";
	sqlite3_stmt *stmt;
	int resultado = sqlite3_prepare_v2(bancoDeDados, sql, -1, &stmt, nil);
    if (resultado == SQLITE_OK) {
        // Informa o parametro tipo (tipo = ?)
        sqlite3_bind_text(stmt, 1, [tipo UTF8String], -1, nil);
        // Executa o SQL
        resultado = sqlite3_step(stmt);
        if (resultado == SQLITE_DONE){
            // Deletado com sucesso
        }
        sqlite3_finalize(stmt);
    }
}
@end