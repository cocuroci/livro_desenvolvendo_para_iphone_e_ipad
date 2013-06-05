//
//  Som.m
//  VideoAula1
//
//  Created by Ricardo Lecheta on 7/27/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SoundUtil.h"

@implementation SoundUtil

- (IBAction)playFile :(NSString *)arquivo {
	
	if(!player){

        // Recupera o diretório do projeto + o arquivo
		NSString* path = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"];
		path = [path stringByAppendingString:arquivo];

        // Cria a URL do arquivo
        NSURL *url = [NSURL fileURLWithPath:path];
        
        [self playUrl:url];

	} else {
        [player play];
    }
}

- (void)playUrl:(NSURL *)url {
    if(!player){

        NSLog(@"Play %@", url);
        
		NSError* error;

		// Inicializa o player com a URL do arquivo
		player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        
        // Configura o volume de 0.0 a 1.0
        [player setVolume: 1.0];
		
		if( ! error ){
            // Se tudo está OK
            // Configura o delegate e inicia a música
			player.delegate = self;
			[player play];
		}
		else{
			NSLog(@"Erro: %@", [error localizedDescription]);
		}
	} else {
        [player play];
    }
}

- (IBAction)pause {
	NSLog(@"pause");
	[player pause];
}

- (IBAction)stop {
	NSLog(@"stop");
	[player stop];
    player = nil;
}

#pragma mark - AVAudioPlayerDelegate

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)aplayer successfully:(BOOL)flag {
    NSLog(@"Fim da música");
	player = nil;
}

@end
