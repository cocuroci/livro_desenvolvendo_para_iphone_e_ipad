//
//  CarroDBCoreData.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/1/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "CarroDBCoreData.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@implementation CarroDBCoreData

+ (Carro *) newInstance {
    // AppDelegate da aplicação
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];

    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // Cria uma instância do Carro (inserindo no managed object context)
    Carro *c = [NSEntityDescription insertNewObjectForEntityForName:@"Carro" inManagedObjectContext:context];
    
    return c;
}

- (NSMutableArray *) getCarrosTipo:(NSString *)tipo {
    // AppDelegate da aplicação
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    // Define a entidade utilizada para a consulta
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Carro" inManagedObjectContext:context];
	
    // Cria a request com os filtros da consulta
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	[request setEntity:entity];
    
    // Buscar por tipo, where tipo=?
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"tipo = %@",tipo];
    [request setPredicate:predicate];
	
    // Ordena a consulta por 'timestamp'
	NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timestamp" ascending:YES];
	NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
	
    // Executa a consulta
	NSError *error;
	NSMutableArray *array = [[context executeFetchRequest:request error:&error] mutableCopy];
    if (!array) {
		// Tratar erros aqui
        NSLog(@"Erro %@", error);
        return nil;
	}
    
    NSLog(@"DB > getCarrosTipo[%@]: %@", tipo, array);

    return array;
}

- (void) salvar:(Carro *)carro {
    // AppDelegate da aplicação
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSLog(@"Salvando Carro [%@]", carro);
    
    // Seta o timestamp (como se fosse o id)
    if(!carro.timestamp){
        carro.timestamp = [NSDate date];
    }
    
    NSError *error;
    BOOL saveOk = [context save:&error];
	if (!saveOk) {
		// Tratar erros aqui
        NSLog(@"Erro %@", error);
	} else {
        NSLog(@"Carro [%@] salvo com sucesso", carro);
    }
}

- (void) deletarCarrosTipo:(NSString *)tipo {
    // Consulta os carros por tipo
    NSMutableArray *carros = [self getCarrosTipo:tipo];
    
    // Deleta todos os carros
    for (Carro *c in carros) {
        [self deletar:c];
    }
}

- (void) deletar:(Carro *)carro {
    // AppDelegate da aplicação
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    
    // Context para salvar/deletar/buscar objetos
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    [context deleteObject:carro];
}

@end