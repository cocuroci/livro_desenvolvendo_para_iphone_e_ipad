//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by Ricardo Lecheta on 9/22/12.
//  Copyright (c) 2012 Ricardo Lecheta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{

}

// Array de carros para preencher o TableView
@property (nonatomic, retain) NSMutableArray *carros;

// Último tipo selecionado
@property (nonatomic, retain) NSString *tipo;

@property (nonatomic, retain) IBOutlet UITableView *tableView;

// Busca os carros pelo tipo selecionado e exibe no TableView
- (void)atualizar;

// Atualiza a lista de carros, conforme o tipo atual selecionado
- (IBAction)alterarTipo:(id)sender;

@end
