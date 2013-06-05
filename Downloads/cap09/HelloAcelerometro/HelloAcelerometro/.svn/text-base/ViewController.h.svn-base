//
//  ViewController.h
//  HelloAcelerometro
//
//  Created by Ricardo Lecheta on 10/6/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate> {

}

// Acelerômetro
@property (nonatomic, retain) IBOutlet UILabel *labelX;
@property (nonatomic, retain) IBOutlet UILabel *labelY;
@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX;
@property (nonatomic, retain) IBOutlet UIProgressView *progressY;
@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

// Giroscópio
@property (nonatomic, retain) IBOutlet UILabel *labelX2;
@property (nonatomic, retain) IBOutlet UILabel *labelY2;
@property (nonatomic, retain) IBOutlet UILabel *labelZ2;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX2;
@property (nonatomic, retain) IBOutlet UIProgressView *progressY2;
@property (nonatomic, retain) IBOutlet UIProgressView *progressZ2;

@property (nonatomic, retain) CMMotionManager *motionManager;

- (void) atualizaAcelerometro:(CMAccelerometerData *)accelerometerData;
- (void) atualizaGiroscopio:(CMGyroData *)gyroData;

@end
