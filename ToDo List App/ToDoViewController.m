//
//  ToDoViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/25/21.
//

#import "ToDoViewController.h"
#import "CustomCellTableViewCell.h"
#import "AddViewController.h"
#import "InProgressViewController.h"
#import "DetailsOfCellViewController.h"
#import "EditCellViewController.h"
#import "TabBarViewController.h"




@interface ToDoViewController ()
{
    AddViewController *add ;
    CustomCellTableViewCell *cell;
    
    NSUserDefaults *ud;
    EditCellViewController *edit;
    NSNumber *num ;
    int dx ;
    
    
}
@end

@implementation ToDoViewController
{
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    _arrayOfIndexes = [NSMutableArray new];
    edit =[self.storyboard instantiateViewControllerWithIdentifier:@"editVC"];
    add=[self.storyboard instantiateViewControllerWithIdentifier:@"addID"];
            ud=[NSUserDefaults standardUserDefaults];
    if ([ud objectForKey:@"names"]!=nil) {
        _names=[[ud objectForKey:@"names"]mutableCopy];
        _descriptions=[[ud objectForKey:@"descriptions"]mutableCopy];
        _priorities=[[ud objectForKey:@"priorities"]mutableCopy];
        _reminders=[[ud objectForKey:@"reminders"]mutableCopy];
        _states=[[ud objectForKey:@"states"]mutableCopy];
        _currentDates=[[ud objectForKey:@"currentDates"]mutableCopy];
        
        add.names =self.names;
        add.descriptions=self.descriptions;
        add.priorities=self.priorities;
        add.reminders=self.reminders;
        add.states=self.states;
        add.currentDates=self.currentDates;
        [ud synchronize];
    }else{
    }
    

    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    _arrayOfIndexes = [NSMutableArray new];
    [_tableV reloadData];
    
    num =[ud objectForKey:@"index"];  
    dx=num.intValue;
    

    
    if (dx == nil) {
      
    }else if (dx == 55){
        
        [_names replaceObjectAtIndex:0 withObject:[ud objectForKey:@"taskname"]];
        [_descriptions replaceObjectAtIndex:0 withObject:[ud objectForKey:@"desc"]];
        [_priorities replaceObjectAtIndex:0 withObject:[ud objectForKey:@"prio"]];
        [_reminders replaceObjectAtIndex:0 withObject:[ud objectForKey:@"reminder"]];
        [_states replaceObjectAtIndex:0 withObject:[ud objectForKey:@"state"]];
        [_tableV reloadData];
        
        //1 4 7 10 done   3 6 9 inprogress   2 5 8
        //saving data
        [ud setObject:self.names forKey:@"names"];
        [ud setObject:self.descriptions forKey:@"descriptions"];
         [ud setObject:self.priorities forKey:@"priorities"];
         [ud setObject:self.reminders forKey:@"reminders"];
         [ud setObject:self.states forKey:@"states"];
         [ud setObject:self.currentDates forKey:@"currentDates"];
    }
  
    else{
       [_names replaceObjectAtIndex:dx withObject:[ud objectForKey:@"taskname"]];
       [_descriptions replaceObjectAtIndex:dx withObject:[ud objectForKey:@"desc"]];
       [_priorities replaceObjectAtIndex:dx withObject:[ud objectForKey:@"prio"]];
       [_reminders replaceObjectAtIndex:dx withObject:[ud objectForKey:@"reminder"]];
       [_states replaceObjectAtIndex:dx withObject:[ud objectForKey:@"state"]];
       [_tableV reloadData];
        
       //saving data
         [ud setObject:self.names forKey:@"names"];
         [ud setObject:self.descriptions forKey:@"descriptions"];
         [ud setObject:self.priorities forKey:@"priorities"];
         [ud setObject:self.reminders forKey:@"reminders"];
         [ud setObject:self.states forKey:@"states"];
         [ud setObject:self.currentDates forKey:@"currentDates"];
        
     
    }
    
    //get indexes of arrays
    for (int i =0; i<[_names count]; i++) {
        [_arrayOfIndexes addObject:[NSNumber numberWithInteger:i]];
    }
    
    [ud setObject:_arrayOfIndexes forKey:@"arrayOfIndexes"];
    

    _arrayOfIndexes =nil;
}









- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_names count];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];

    cell.titleCell.text=[_names objectAtIndex:indexPath.row];
    cell.dateCell.text=[_currentDates objectAtIndex:indexPath.row];
    
    NSString *x = [_priorities objectAtIndex:indexPath.row];
    if ([x isEqualToString:@"High"] ) {
        cell.imgCell.image=[UIImage imageNamed:@"check"];
        cell.prioCell.text=@"High" ;
    }else if ([x isEqualToString:@"Medium"]){
        cell.imgCell.image=[UIImage imageNamed:@"tick-mark"];
        cell.prioCell.text=@"Medium" ;
    }else if ([x isEqualToString:@"Low"]){
        cell.imgCell.image=[UIImage imageNamed:@"check-mark"];
        cell.prioCell.text=@"Low" ;
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailsOfCellViewController *detail =[self.storyboard instantiateViewControllerWithIdentifier:@"detailVC"];
    detail.nameS=[_names objectAtIndex:indexPath.row];
    detail.descS=[_descriptions objectAtIndex:indexPath.row];
    detail.priS=[_priorities objectAtIndex:indexPath.row];
    detail.remindS=[_reminders objectAtIndex:indexPath.row];
    detail.stateS=[_states objectAtIndex:indexPath.row];
    NSArray *indexes = [self.tableV indexPathsForSelectedRows];
    NSUInteger indexi;
    for (NSIndexPath *path in indexes) {
         indexi= [path indexAtPosition:[path length] - 1];
    }
    detail.detailIndex =indexi;
  
   
    [self.navigationController pushViewController:detail animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}






- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_names removeObjectAtIndex:indexPath.row];
        [_descriptions removeObjectAtIndex:indexPath.row];
        [_priorities removeObjectAtIndex:indexPath.row];
        [_reminders removeObjectAtIndex:indexPath.row];
        [_states removeObjectAtIndex:indexPath.row];
        [_currentDates removeObjectAtIndex:indexPath.row];

        
         [ud setObject:self.names forKey:@"names"];
         [ud setObject:self.descriptions forKey:@"descriptions"];
         [ud setObject:self.priorities forKey:@"priorities"];
         [ud setObject:self.reminders forKey:@"reminders"];
         [ud setObject:self.states forKey:@"states"];
         [ud setObject:self.currentDates forKey:@"currentDates"];
        
        [ud setObject:nil forKey:@"index"];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}






- (IBAction)addTask:(id)sender {
      [self.navigationController pushViewController:add animated:YES ];
    [add setMyArrP:self];
}





-(void)transArrFromAddToToDo{
    
    
    self.names =add.names;
    self.descriptions=add.descriptions;
    self.priorities=add.priorities;
    self.reminders=add.reminders;
    self.states=add.states;
    self.currentDates=add.currentDates;
    [_tableV reloadData];
       [ud setObject:self.names forKey:@"names"];
        [ud setObject:self.descriptions forKey:@"descriptions"];
        [ud setObject:self.priorities forKey:@"priorities"];
        [ud setObject:self.reminders forKey:@"reminders"];
        [ud setObject:self.states forKey:@"states"];
        [ud setObject:self.currentDates forKey:@"currentDates"];
     
      
    }
  








@end
