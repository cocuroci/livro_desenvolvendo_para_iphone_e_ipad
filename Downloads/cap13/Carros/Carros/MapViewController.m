//
//  MapViewController.m
//  Carros
//
//  Created by Ricardo Lecheta on 10/1/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize mapView = _mapView;
@synthesize carro;
@synthesize ultimaLatitude, ultimaLongitude;

#pragma mark View Life Cycle
- (void)viewDidLoad {

	self.title = carro.nome;
    
    // Insere o botão Ver Rota na navigation bar
	UIBarButtonItem *btRota = [[[UIBarButtonItem alloc] initWithTitle:@"Ver Rota"
                                                                  style:UIBarButtonItemStyleBordered target:self action:@selector(exibirRota)] autorelease];
    self.navigationItem.rightBarButtonItem = btRota;

	// Cria uma coordenada
	MKCoordinateRegion coordenada;
	coordenada.center.latitude = [self.carro.latitude doubleValue];
	coordenada.center.longitude = [self.carro.longitude doubleValue];
    
    NSLog(@"Lat/Lng %@/%@", self.carro.latitude, self.carro.longitude);
    
    // Configura o modo satélite
    [self.mapView setMapType:MKMapTypeSatellite];

    // Centraliza o mapa nesta coordenada
    [self.mapView setRegion:coordenada animated:YES];

    // Adiciona o marcador "pin" no mapa
    MKPointAnnotation *pin = [[[MKPointAnnotation alloc] init] autorelease];
    [pin setCoordinate:coordenada.center];
    [pin setTitle:[NSString stringWithFormat:@"Fábrica %@", self.carro.nome]];
    [self.mapView addAnnotation:pin];

    // Delegate
    self.mapView.delegate = self;
}

#pragma mark Liga e Desligar o GPS

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Inicia o LocationManager para monitora as coordenadas GPS
    self.locationManager = [[CLLocationManager alloc] init];
    
    // Delegate para receber as coordenadas
    self.locationManager.delegate = self;
    
    // Filtra de 100 em 100 metros
    self.locationManager.distanceFilter = 100.00;
    
    // Precisão máxima!
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    /*
        No projeto o requisito é exibir o mapa na coordenada da fábrica do Carro
        
        Para testar o monitoramento por GPS descomente a linha abaixo.
     
        Note que consequemente a coordenada da fábrica não será mais exibida, porque o GPS vai retornar as coordenadas.
     
        Para simular as coordenadas no simulador acesse o menu > Debug > Location
     */
    
    // Começa a monitorar o GPS
    [self.locationManager startUpdatingLocation];

}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Desliga o monitoramento do GPS
    [self.locationManager stopUpdatingLocation];
}

#pragma mark MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:@"pinView"];
    if(!pinView) {
		// Cria a view
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pinView"];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;
        UIButton *btPin = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = btPin;
    } else {
        // Existe no cache, vamos reaproveitar
        pinView.annotation = annotation;
    }

	// Retorna a view que será exibida ao usuário
    return pinView;
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	// Clicou no botão da view
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"MapView" message:@"Opa!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);

    CLLocationDistance altitude = newLocation.altitude;
    CLLocationDegrees latitude  = newLocation.coordinate.latitude;
    CLLocationDegrees longitude = newLocation.coordinate.longitude;

    NSLog(@"Altitude, Latitude, Longitude: %f, %f, %f", altitude, latitude, longitude);
    
    // Salva a latitude e longitude atuais para desenhar a rota
    self.ultimaLatitude = [NSString stringWithFormat:@"%f", latitude];
    self.ultimaLongitude = [NSString stringWithFormat:@"%f", longitude];

    // Distância percorrida
    CLLocationDistance distancia = [newLocation distanceFromLocation:oldLocation];
    NSLog(@"Distância %f", distancia);

    // Cria um MKCoordinateRegion necessario para exibir a localizacao no mapa
    MKCoordinateRegion coordenada = {{0.0,0.0}, {0.0,0.0}};
    coordenada.center.latitude  = latitude;
    coordenada.center.longitude = longitude;

    // Centraliza o mapa nesta coordenada
    [self.mapView setRegion:coordenada animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"Error: %@", [error description]);
}

#pragma mark Metodos de Teste

// Exibe a rota entre a posição atual e a localização da fábrica
- (void)exibirRota {
    
    CLLocation *origem = nil;
    CLLocation *destino = nil;
    
    MKCoordinateRegion coordenada;
	coordenada.center.latitude = [self.carro.latitude doubleValue];
	coordenada.center.longitude = [self.carro.longitude doubleValue];

    NSString *s1 = [NSString stringWithFormat:@"%f,%f", origem.coordinate.latitude, origem.coordinate.longitude];
    NSString *s2 = [NSString stringWithFormat:@"%f,%f", destino.coordinate.latitude, destino.coordinate.longitude];

    // http://maps.google.com/maps?saddr={origem}&daddr={destino}
    NSString *url = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%@&daddr=%@&hl=pt", s1, s2];
    
    NSLog(@"URL %@", url);
    
    // Hotel Copacabana para o Cristo Redentor
    url = @"https://maps.google.com/maps?saddr=-22.967482,-43.178802&daddr=-22.951915,-43.21056";

    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:url]];
}

#pragma mark dealloc
- (void)dealloc {
    _mapView.delegate = nil;

    [_mapView release];
    [carro release];

    [ultimaLatitude release];
    [ultimaLongitude release];

    [super dealloc];
}

@end
