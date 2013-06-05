//
//  ViewController.m
//  HelloAcelerometro
//
//  Created by Ricardo Lecheta on 10/6/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize labelX, labelX2;
@synthesize labelY, labelY2;
@synthesize labelZ, labelZ2;

@synthesize progressX, progressX2;
@synthesize progressY, progressY2;
@synthesize progressZ, progressZ2;

@synthesize motionManager;

#pragma mark View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Inicia o acelerômetro
    self.motionManager = [[CMMotionManager alloc] init];
    
    // Tempo para receber updates
    self.motionManager.accelerometerUpdateInterval = 0.1;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

     // Acelerômetro
    if([self.motionManager isAccelerometerAvailable]) {
        [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:
         ^(CMAccelerometerData *accelerometerData, NSError *error)
         {
             // Atualiza a tela na thread principal (UI Thread)
             [self performSelectorOnMainThread:@selector(atualizaAcelerometro:) withObject:accelerometerData waitUntilDone:YES];
         }
         ];
    } else {
        NSLog(@"Sensor de acelerômetro não disponível");
    }

    // Giroscópio
    if([self.motionManager isGyroAvailable]) {
        [self.motionManager startGyroUpdatesToQueue:queue withHandler:
         ^(CMGyroData *gyroData, NSError *error)
         {
             // Atualiza a tela na thread principal (UI Thread)
             [self performSelectorOnMainThread:@selector(atualizaGiroscopio:) withObject:gyroData waitUntilDone:YES];
         }
         ];
    }  else {
        NSLog(@"Sensor de giroscópio não disponível");
    }
}
-  (void)viewDidUnload {
    // Para o monitoramento
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];

    [super viewDidUnload];
}

#pragma mark métodos
// Acelerômetro
- (void) atualizaAcelerometro:(CMAccelerometerData *)accelerometerData {
    labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", accelerometerData.acceleration.x];
    labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", accelerometerData.acceleration.y];
    labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", accelerometerData.acceleration.z];
    
    self.progressX.progress = ABS(accelerometerData.acceleration.x);
    self.progressY.progress = ABS(accelerometerData.acceleration.y);
    self.progressZ.progress = ABS(accelerometerData.acceleration.z);
}
// Giroscópio
- (void) atualizaGiroscopio:(CMGyroData *)gyroData {
    NSLog(@"atualizaGiroscopio");
    labelX2.text = [NSString stringWithFormat:@"%@%f", @"X: ", gyroData.rotationRate.x];
    labelY2.text = [NSString stringWithFormat:@"%@%f", @"Y: ", gyroData.rotationRate.y];
    labelZ2.text = [NSString stringWithFormat:@"%@%f", @"Z: ", gyroData.rotationRate.z];
    
    self.progressX2.progress = ABS(gyroData.rotationRate.x);
    self.progressY2.progress = ABS(gyroData.rotationRate.y);
    self.progressZ2.progress = ABS(gyroData.rotationRate.z);
}

#pragma mark - rotation iOS 5
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return toInterfaceOrientation == UIInterfaceOrientationPortrait;
}
#pragma mark - rotation iOS 6
- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
