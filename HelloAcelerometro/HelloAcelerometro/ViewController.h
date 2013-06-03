//
//  ViewController.h
//  HelloAcelerometro
//
//  Created by André Cocuroci on 03/06/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController <UIAccelerometerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *labelX;
@property (strong, nonatomic) IBOutlet UILabel *labelY;
@property (strong, nonatomic) IBOutlet UILabel *labelZ;

@property (strong, nonatomic) IBOutlet UIProgressView *progressX;
@property (strong, nonatomic) IBOutlet UIProgressView *progressY;
@property (strong, nonatomic) IBOutlet UIProgressView *progressZ;


@property (strong, nonatomic) IBOutlet UILabel *labelX2;
@property (strong, nonatomic) IBOutlet UILabel *labelY2;
@property (strong, nonatomic) IBOutlet UILabel *labelZ2;

@property (strong, nonatomic) IBOutlet UIProgressView *progressX2;
@property (strong, nonatomic) IBOutlet UIProgressView *progressY2;
@property (strong, nonatomic) IBOutlet UIProgressView *progressZ2;

@property (nonatomic, retain) CMMotionManager *motionManager;
@end
