//
//  ListaCarrosViewController.h
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaCarrosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableArray *carros;
@property (retain, nonatomic) NSString *tipo;

-(void)atualizar;
-(IBAction)alterarTipo:(id)sender;
-(void)downloadImg:(NSDictionary *)params;
-(void)showImg:(NSDictionary *)params;

@end
