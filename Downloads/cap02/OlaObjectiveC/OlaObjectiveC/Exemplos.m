//
//  Exemplos.m
//  OlaObjectiveC
//
//  Created by Ricardo Lecheta on 10/2/12.
//
//

#import "Exemplos.h"
#import "Carro.h"
#import "VelocidadeException.h"
#import "PostoDeGasolina.h"
#import "LavaCar.h"

@implementation Exemplos

+ (void) exemploRelease {
    Carro *c = [[Carro alloc] initWithNome:@"Fusca 1" andAno:1934] ;
    Carro *c2 = [[Carro alloc] initWithNome:@"Fusca 2" andAno:1934] ;
    
    LavaCar *l = [[LavaCar alloc] init];
    [l setCarro:c];
    [l lavarCarro];
    
    [l setCarro:c2];
    [l lavarCarro];
    
    [c release];
    [c2 release];
    [l release];
}

+ (void)exemploException {

    Carro *c = [[Carro alloc] initWithNome:@"Fusca" andAno:81];

    NSString *nome = [c getNome];
    NSLog(@"Nome do carro %@", nome);
    
    @try {
        [c acelerar:121 eDistancia:1000];
    }
    @catch (VelocidadeException *e) {
        NSLog(@"Erro: %@", [e reason]);
    }
    @finally {
        
    }
}

+ (void)exemploProtocolos {
    
    Carro *c = [[Carro alloc] initWithNome:@"Fusca" andAno:81];
    
    // O carro implementa o protocolo CombustivelFlex!
    
    // Carro é do tipo Alcool
    [PostoDeGasolina abastecerCarroComAlcool:c];
    
    // Carro também é do tipo Gasolina
    [PostoDeGasolina abastecerCarroComGasolina:c];
}

+ (void)exemplo_NSLog_ConversaoStrings {
    char const * mensagem = "Hello World";
    printf("Mensagem com string em C ANSI: %s", mensagem);
    printf("\n");
    
    // Convertendo a string em C ANSI para NSString
    NSString *mensagem2 = [NSString stringWithCString:"Hello World" encoding:NSUTF8StringEncoding];
    NSLog(@"Mensagem com NSString: %@", mensagem2);
    
    // Convertendo a NSString para um (char const *)
    char const *mensagem3 = [mensagem2 cStringUsingEncoding:NSUTF8StringEncoding];
    printf("Agora a NSString foi novamente convertida para C ANSI: %s", mensagem3);
    printf("\n");

    NSString *s = @"String aqui";
    int numero = 7;
    double decimal = 12.5;
    NSLog(@"Exemplo de formatação: %@, número inteiro: %d, número decimal: %f", s, numero, decimal);
}

+ (void)exemploArray {
    // Arrays
    Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
    Carro *c2 = [[Carro alloc] initWithNome:@"Chevete" andAno:1973];
    Carro *c3 = [[Carro alloc] initWithNome:@"Brasilia" andAno:1973];

    NSArray *array1 = [[NSArray alloc] initWithObjects:c1, c2, c3, nil];

    NSMutableArray *array2 = [[NSMutableArray alloc] init];
    [array2 addObject:c1];
    [array2 addObject:c2];
    [array2 addObject:c3];

    NSInteger count = [array1 count];

    for (int i = 0; i <  count; i++) {
       Carro *c = [array1 objectAtIndex:i];
        NSLog(@"Carro[%d] = %@ (%d)", i, [c getNome], [c getAno]);
    }

    // Libera memória
    [c1 release];
    [c2 release];
    [c3 release];

    // Libera memória
    [array1 release];
    [array2 release];
}

+ (void) exemploDictionary {
    Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
    Carro *c2 = [[Carro alloc] initWithNome:@"Chevete" andAno:1973];
    Carro *c3 = [[Carro alloc] initWithNome:@"Brasilia" andAno:1973];

    NSDictionary *hash1 = [[NSDictionary alloc] initWithObjectsAndKeys:c1,@"c1",c2,@"c2",c3,@"c3",nil];
    
    NSMutableDictionary *hash2 = [[NSMutableDictionary alloc] init];
    [hash2 setObject:c1 forKey:@"c1"];
    [hash2 setObject:c2 forKey:@"c2"];
    [hash2 setObject:c3 forKey:@"c3"];
    
    Carro *c = [hash1 objectForKey:@"c1"];
    NSLog(@"Carro = %@ (%d)", [c getNome], [c getAno]);
    
    [c1 release];
    [c2 release];
    [c3 release];
    
    [hash1 release];
    [hash2 release];
}

+ (void)exemploEquals {
    
    Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
    
    Carro *c2 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
    
    BOOL b = [c1 isEqual:c2];
    
    NSLog(@"Objetos iguais? %@", b ? @"YES" : @"NO");
}

+ (void) exemploInstanceof {
    
    Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1934];
    
    BOOL b = [c1 isKindOfClass:[Carro class]];
    
    NSLog(@"Objeto carro é da classe Carro? %@", b ? @"YES" : @"NO");
    
    b = [c1 conformsToProtocol:@protocol(CombustivelAlcool)];
    
    NSLog(@"Objeto carro implementa o protocolo CombustivelAlcool ? %@", b ? @"YES" : @"NO");
}

@end
