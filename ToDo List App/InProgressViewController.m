//
//  InProgressViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/25/21.
//

#import "InProgressViewController.h"
#import "CustomCellTableViewCell.h"
#import "DoneViewController.h"
#import "ToDoViewController.h"
#import "AddViewController.h"
#import "DetailsOfCellViewController.h"


@interface InProgressViewController ()
{
    NSUserDefaults *ud ;
    NSNumber *numb ;
    int z;
    
}

@end

@implementation InProgressViewController
{
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ud = [NSUserDefaults standardUserDefaults];
    
}


-(void)viewWillAppear:(BOOL)animated{
    
    _checknames =[NSMutableArray new];
    _checkdescriptions =[NSMutableArray new];
    _checkpriorities =[NSMutableArray new];
    _checkreminders= [NSMutableArray new];;
    _checkstates =[NSMutableArray new];
    _checkcurrentDates =[NSMutableArray new];
    _arrayOfIndexs =[NSMutableArray new];
    
    _namesP=[[ud objectForKey:@"names"]mutableCopy];
    _descriptionsP=[[ud objectForKey:@"descriptions"]mutableCopy];
    _prioritiesP=[[ud objectForKey:@"priorities"]mutableCopy];
    _remindersP=[[ud objectForKey:@"reminders"]mutableCopy];
    _statesP=[[ud objectForKey:@"states"]mutableCopy];
    _currentDatesP=[[ud objectForKey:@"currentDates"]mutableCopy];
    

    for (int y=0; y<[_namesP count]; y++) {
        if ([[_statesP objectAtIndex:y ]isEqualToString:@"InProgress"]) {
            [_checknames addObject:[_namesP objectAtIndex:y]];
            [_checkstates addObject:[_statesP objectAtIndex:y]];
            [_checkreminders addObject:[_remindersP objectAtIndex:y]];
            [_checkpriorities addObject:[_prioritiesP objectAtIndex:y]];
            [_checkdescriptions addObject:[_descriptionsP objectAtIndex:y]];
            [_checkcurrentDates addObject:[_currentDatesP objectAtIndex:y]];
            [_arrayOfIndexs addObject:[NSNumber numberWithInteger:y]];
            
        }
    }
    [_tableV reloadData];
    
//    for (int i=0; i<[_arrayOfIndexs count]; i++) {
//
//        NSNumber *num = [_arrayOfIndexs objectAtIndex:i];
//        int x = [num intValue];
//        printf("%d\n",x);
//    }

}
- (void)viewWillDisappear:(BOOL)animated{

        _checknames =nil;
        _checkdescriptions=nil;
        _checkpriorities=nil;
        _checkreminders =nil;
        _checkstates =nil;
        _checkcurrentDates =nil;
        _arrayOfIndexs =nil;

    _namesP=nil;
    _descriptionsP=nil;
    _prioritiesP =nil;
    _remindersP =nil;
    _statesP =nil;
    _currentDatesP =nil;
    [_tableV reloadData];

}













- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_checknames count];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCellTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.titleCell.text=[_checknames objectAtIndex:indexPath.row];
    cell.dateCell.text=[_checkcurrentDates objectAtIndex:indexPath.row];
    NSString *x = [_checkpriorities objectAtIndex:indexPath.row];
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
    detail.nameS=[_checknames objectAtIndex:indexPath.row];
    detail.descS=[_checkdescriptions objectAtIndex:indexPath.row];
    detail.priS=[_checkpriorities objectAtIndex:indexPath.row];
    detail.remindS=[_checkreminders objectAtIndex:indexPath.row];
    detail.stateS=[_checkstates objectAtIndex:indexPath.row];
   NSNumber *number= [_arrayOfIndexs objectAtIndex:indexPath.row];
    int intValue = [number intValue];
    detail.detailIndex =intValue;
    [self.navigationController pushViewController:detail animated:YES];
}






- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}





//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        
// 
//        NSNumber *number= [_arrayOfIndexs objectAtIndex:indexPath.row];
//         int intValue = [number intValue];
//        
//        [_checknames removeObjectAtIndex:indexPath.row];
//        [_checkdescriptions removeObjectAtIndex:indexPath.row];
//        [_checkpriorities removeObjectAtIndex:indexPath.row];
//        [_checkreminders removeObjectAtIndex:indexPath.row];
//        [_checkstates removeObjectAtIndex:indexPath.row];
//        [_checkcurrentDates removeObjectAtIndex:indexPath.row];
//        
//        
//        
//}






@end
