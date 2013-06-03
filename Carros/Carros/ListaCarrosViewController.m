//
//  ListaCarrosViewController.m
//  Carros
//
//  Created by André Cocuroci on 31/05/13.
//  Copyright (c) 2013 André Cocuroci. All rights reserved.
//

#import "ListaCarrosViewController.h"
#import "DetalhesViewController.h"
#import "Alerta.h"
#import "Carro.h"
#import "CarroCell.h"
#import "CarroService.h"

@interface ListaCarrosViewController ()

@end

@implementation ListaCarrosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Carros";
    
    self.carros = [CarroService getCarros];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.carros count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CarroCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CarroCell" owner:self options:nil] objectAtIndex:0];
    }
    
    //cell.textLabel.text = [NSString stringWithFormat:@"Carro %d", indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:@"ferrari_ff.png"];
    
    Carro *carro = [self.carros objectAtIndex:indexPath.row];
    
//    cell.textLabel.text = carro.nome;
//    cell.imageView.image = [UIImage imageNamed:carro.url_foto];
    
    cell.cellDesc.text = carro.nome;
    cell.cellImg.image = [UIImage imageNamed:carro.url_foto];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *msg = [NSString stringWithFormat:@"Selecionou o %@", carro.nome];
//    [Alerta alerta:msg];
    
    Carro *carro = [self.carros objectAtIndex:indexPath.row];
    DetalhesViewController *detalhes = [[[DetalhesViewController alloc] init] autorelease];
    detalhes.carro = carro;
    [self.navigationController pushViewController:detalhes animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

#pragma mark - rotation iOS 6
-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

#pragma mark - dealloc
- (void)dealloc {
    [_tableView release];
    [_carros release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setTableView:nil];
    [self setCarros:nil];
    [super viewDidUnload];
}
@end
