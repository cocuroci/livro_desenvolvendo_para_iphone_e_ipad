//
//  MapaViewController.m
//  Carros
//
//  Created by André Cocuroci on 01/08/13.
//  Copyright (c) 2013 Ricardo Lecheta. All rights reserved.
//

#import "MapaViewController.h"

@interface MapaViewController ()

@end

@implementation MapaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.carro.nome;
    
    self.mapView.delegate = self;
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake([self.carro.latitude doubleValue], [self.carro.longitude doubleValue]);
    
    CLLocationDistance distance = 500;
    
    //Cria uma coordenada
    MKCoordinateRegion coordenada = MKCoordinateRegionMakeWithDistance(coord, distance, distance);
    
    //coordenada.center.latitude = [self.carro.latitude doubleValue];
    //coordenada.center.longitude = [self.carro.longitude doubleValue];
    
    //Centraliza o mapa nesta coordenata
    [self.mapView setRegion:coordenada animated:YES];
    
    //Configura o tipo do mapa
    [self.mapView setMapType:MKMapTypeStandard];
    
    //Adiciona um marcador no mapa
    MKPointAnnotation *pin = [[[MKPointAnnotation alloc] init] autorelease];
    [pin setCoordinate:coord];
    [pin setTitle:[NSString stringWithFormat:@"Fábrica %@", self.carro.nome]];
    [self.mapView addAnnotation:pin];    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Inicia o LocationManager para monitorar as coordenadas GPS
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = 100.00;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    [self.locationManager startUpdatingLocation];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    // Desliga o monitoramento do GPS
    [self.locationManager stopUpdatingLocation];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    
    if (!pinView) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        UIButton *btPin = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = btPin;
    } else {
        pinView.annotation = annotation;
    }
    
    return pinView;
}

-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    MKPointAnnotation *annotation = view.annotation;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MapView" message:annotation.title delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    
    NSLog(@"Location: %@", [location description]);   
    
    //CLLocationDistance altitude = location.altitude;
    CLLocationDegrees latitude = location.coordinate.latitude;
    CLLocationDegrees longitude = location.coordinate.longitude;
    
    // Cria um MKCoordinateRetion necessario para exibir localizacao do mapa
    MKCoordinateRegion coordenada = {{0.0,0.0},{0.0,0.0}};
    coordenada.center.latitude = latitude;
    coordenada.center.longitude = longitude;
    
    //centraliza a coordenada
    [self.mapView setRegion:coordenada animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", [error description]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    _mapView.delegate = nil;
    [_mapView release];
    _locationManager.delegate = nil;
    [_locationManager release];
    [_carro release];
    [super dealloc];
}

@end
