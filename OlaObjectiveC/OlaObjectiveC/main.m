//
//  main.m
//  OlaObjectiveC
//
//  Created by André Cocuroci on 28/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Carro.h"
#import "VelocidadeException.h"
#import "PostoDeGasolina.h"
#import "LavaCar.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        NSString *s = @"String aqui";
//        int numero = 7;
//        double decimal = 12.5;
//        
//        NSLog(@"Texto: %@, número inteiro %d, numero decimal %f", s, numero, decimal);
//        
//        //Carro *c = [[Carro alloc] init];
//        
//        //[c setNome:@"Fusca"];
//        //[c setAno:1943];
//        
//        Carro *c = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
//        
//        NSString *nome = [c getNome];
//        int ano = [c getAno];
//        
//        NSLog(@"Carro %@ [%d]", nome, ano);
//        
//        [c acelearComVelocidade:110 eDistancia:1000];
//        
//        @try {
//            [c acelearComVelocidade:121 eDistancia:1000];
//        }
//        @catch (VelocidadeException *e) {
//            NSLog(@"Erro: %@",[e reason]);
//        }
//        @finally {
//            
//        }
//        
//        [PostoDeGasolina abastecerCarroComAlcool:c];
//        [c release];
        
        
//        Carro *c = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
//        NSLog(@"Carro[%d] = %@ (%d)", argc, [c getNome], [c getAno]);
//        
//        NSLog(@"retainCount = %ld", [c retainCount]);
//        [c retain];
//        
//        NSLog(@"retainCount = %ld", [c retainCount]);
//        [c release];
//        
//        NSLog(@"retainCount = %ld", [c retainCount]);
        
//        Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
//        Carro *c2 = [[Carro alloc] initWithNome:@"Chevette" andAno:1973];
//        LavaCar *l = [[LavaCar alloc] init];
//        
//        [l setCarro:c1];
//        [l lavarCarro];
//        
//        [l setCarro:c2];
//        [l lavarCarro];
//        
//        [c1 release];
//        [c2 release];
//        [l release];
        
//        Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
//        Carro *c2 = [[Carro alloc] initWithNome:@"Chevette" andAno:1973];
//        Carro *c3 = [[Carro alloc] initWithNome:@"Brasilia" andAno:1973];
//        
//        NSLog(@"retains: %ld,%ld,%ld", [c1 retainCount], [c2 retainCount], [c3 retainCount]);
//        
//        NSArray *array1 = [[NSArray alloc] initWithObjects:c1,c2,c3,nil];
//        
//        NSLog(@"retains: %ld,%ld,%ld", [c1 retainCount], [c2 retainCount], [c3 retainCount]);
//        
//        NSMutableArray *array2 = [[NSMutableArray alloc] init];
//        
//        
//        [array2 addObject:c1];
//        [array2 addObject:c2];
//        [array2 addObject:c3];
//        
//        NSLog(@"retains: %ld,%ld,%ld", [c1 retainCount], [c2 retainCount], [c3 retainCount]);
//        
//        NSInteger count = [array1 count];
//        for (int i = 0; i < count; i++) {
//            Carro *c = [array1 objectAtIndex:i];
//            NSLog(@"Carro[%d] = %@ (%d)", i, [c getNome], [c getAno]);
//        }
//        
//        [c1 release];
//        [c2 release];
//        [c3 release];
//        
//        NSLog(@"retains: %ld,%ld,%ld", [c1 retainCount], [c2 retainCount], [c3 retainCount]);
//        
//        [array1 release];
//        
//        NSLog(@"retains: %ld,%ld,%ld", [c1 retainCount], [c2 retainCount], [c3 retainCount]);
//        [array2 release];
        
        Carro *c1 = [[Carro alloc] initWithNome:@"Fusca" andAno:1943];
        Carro *c2 = [[Carro alloc] initWithNome:@"Chevette" andAno:1973];
        Carro *c3 = [[Carro alloc] initWithNome:@"Brasilia" andAno:1973];
        
        NSDictionary *hash1 = [[NSDictionary alloc] initWithObjectsAndKeys:c1,@"c1",c2,@"c2",c3,@"c3",nil];
        
        NSLog(@"é igual: %@", [c1 isKindOfClass:[Carro class]] ? @"YES" : @"NO");
        
        NSMutableDictionary *hash2 = [[NSMutableDictionary alloc] init];
        [hash2 setObject:c1 forKey:@"c1"];
        [hash2 setObject:c2 forKey:@"c2"];
        [hash2 setObject:c3 forKey:@"c3"];
        
        Carro *c = [hash1 objectForKey:@"c1"];
        NSLog(@"Carro %@ (%d)", [c getNome], [c getAno]);
        
        [c1 release];
        [c2 release];
        [c3 release];
        
        [hash1 release];
        [hash2 release];
    }
    
    return 0;
}

