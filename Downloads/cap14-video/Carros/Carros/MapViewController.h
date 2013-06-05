//
//  MapViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 10/1/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MapKit/MapKit.h>

#import "Carro.h"

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

// Para ler a Latitude e Longitude
@property (nonatomic, retain) Carro *carro;

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

// Para ligar e desligar o GPS
@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) NSString *ultimaLatitude;
@property (nonatomic, retain) NSString *ultimaLongitude;

@end
