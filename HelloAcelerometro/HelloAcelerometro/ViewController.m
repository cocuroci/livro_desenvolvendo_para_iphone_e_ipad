//
//  ViewController.m
//  HelloAcelerometro
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
//    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
//    accelerometer.updateInterval = 0.1;
//    accelerometer.delegate = self;
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.1;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [self.motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        
        [self performSelectorOnMainThread:@selector(atualizaAcelerometro:) withObject:accelerometerData waitUntilDone:YES];
        
    }];
    
    [self.motionManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData *gyroData, NSError *error) {
        
        [self performSelectorOnMainThread:@selector(atualizaGiroscopio:) withObject:gyroData waitUntilDone:YES];
    }];
}

-(void)atualizaAcelerometro:(CMAccelerometerData *)accelerometerData
{
    self.labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", accelerometerData.acceleration.x];
    self.labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", accelerometerData.acceleration.y];
    self.labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", accelerometerData.acceleration.z];
    
    self.progressX.progress = ABS(accelerometerData.acceleration.x);
    self.progressY.progress = ABS(accelerometerData.acceleration.y);
    self.progressZ.progress = ABS(accelerometerData.acceleration.z);
}

-(void)atualizaGiroscopio:(CMGyroData *)gyroData
{
    self.labelX2.text = [NSString stringWithFormat:@"%@%f", @"X: ", gyroData.rotationRate.x];
    self.labelY2.text = [NSString stringWithFormat:@"%@%f", @"Y: ", gyroData.rotationRate.y];
    self.labelZ2.text = [NSString stringWithFormat:@"%@%f", @"Z: ", gyroData.rotationRate.z];
    
    self.progressX2.progress = ABS(gyroData.rotationRate.x);
    self.progressY2.progress = ABS(gyroData.rotationRate.y);
    self.progressZ2.progress = ABS(gyroData.rotationRate.z);
}


//-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
//{
//    self.labelX.text = [NSString stringWithFormat:@"%@%f", @"X: ", acceleration.x];
//    self.labelY.text = [NSString stringWithFormat:@"%@%f", @"Y: ", acceleration.y];
//    self.labelZ.text = [NSString stringWithFormat:@"%@%f", @"Z: ", acceleration.z];
//    
//    self.progressX.progress = ABS(acceleration.x);
//    self.progressY.progress = ABS(acceleration.y);
//    self.progressZ.progress = ABS(acceleration.z);
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
