//
//  DownloadImageView.m
//  Carros
//
//  Created by Ricardo Lecheta on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DownloadImageView.h"

@implementation DownloadImageView

@synthesize url;

#define LOG_ON      NO
#define CACHE_ON    YES

#pragma mark - ciclo de vida
// Chamado se o objeto é instanciado pelo código
- (id)initWithFrame:(CGRect)rect {
    if (self = [super initWithFrame:rect]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}
// Chamado se o objeto é instanciado pelo arquivo xib
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:progress];
    }
    return self;
}
// Configura o layout
- (void)layoutSubviews {
    [super layoutSubviews];
    // Inicializa o progress no centro
    progress.center = [self convertPoint:self.center fromView:self.superview];
}

// Sobrescreve o setUrl para fazer o download em background
- (void)setUrl:(NSString *)urlParam {
    if ([urlParam length] == 0) {
        url = nil;
        self.image = nil;
    }
    else if (urlParam != self.url) {

        url = [urlParam copy];
        self.image = nil;
        
        if (!queue) {
            queue = [[NSOperationQueue alloc] init];
        }
        
        [queue cancelAllOperations];
        
        // Inicia a animação do Spinner
        [progress startAnimating];
        
        // Dispara o download em uma NSOperation
        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadImg) object:nil];
        [queue addOperation:operation];
    }
}

#pragma mark - download em background
// Faz download da imagem
- (void)downloadImg {
    // Cria caminho do arquivo para salvar a img em cache
    NSString* file = [url stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
    file = [file stringByReplacingOccurrencesOfString:@":" withString:@"_"];
    file = [@"/Documents/" stringByAppendingString:file];
    file = [NSHomeDirectory() stringByAppendingString:[NSString stringWithString:file]];
    if(LOG_ON && CACHE_ON) {
        NSLog(@"Arquivo img %@", file);
    }
    
    // Se existe no Cache
    if(CACHE_ON && [[NSFileManager defaultManager] fileExistsAtPath:file])
    {
        // Lê a imagem do cache
        NSData* data = [NSData dataWithContentsOfFile:file];
        
        if(data)
        {   
            if(LOG_ON) {
                NSLog(@"Encontrado no cache %@ " , url);
            }
            UIImage *img = [[UIImage alloc] initWithData:data];
            // Atualiza o UIImageView com a imagem carregada do cache
            [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
            
            return;   
        }
    }

    // Senão Faz download (este método é executado em outra thread)
    if(LOG_ON) {
        NSLog(@"Download URL %@", url);
    }
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    UIImage *img = [[UIImage alloc] initWithData:data];
    
    // Salva no Cache
    if(CACHE_ON) {
        if(LOG_ON) {
            NSLog(@"Salvo no cache URL %@", url);
        }
        [data writeToFile:file atomically:YES];
    }
    
    // Depois do download, atualiza o UIImageView na thread principal
    [self performSelectorOnMainThread:@selector(showImg:) withObject:img waitUntilDone:YES];
    // Libera memória
}
// Atualiza o UIImageView com o resultado
- (void)showImg:(UIImage *)imagem {
    // Atualiza o objeto UIImage dentro do UIImageView
    self.image = imagem;
    // Encerra a animação do Spinner
    [progress stopAnimating];
}

#pragma mark - dealloc

- (void)dealloc {
    [progress removeFromSuperview];

    [super dealloc];
}

@end
