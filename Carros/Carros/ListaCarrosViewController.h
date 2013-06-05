//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transacao.h"

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate, Transacao>
{

}

// Array de carros para preencher o TableView
@property (nonatomic, retain) NSMutableArray *carros;

// Ultimo tipo selecionado
@property (nonatomic, retain) NSString *tipo;

// TableView no xib
@property (nonatomic, retain) IBOutlet UITableView *tableView;

// Activity Indicator no xib
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *progress;

//Segmented Control
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentControl;

// Busca os carros pelo tipo selecionado e exibe no TableView
- (void)atualizar;

// Segment Control: Atualiza a lista de carros, conforme o tipo selecionado
- (IBAction)alterarTipo:(id)sender;

@end
