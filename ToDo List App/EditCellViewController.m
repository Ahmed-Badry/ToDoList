//
//  EditCellViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/28/21.
//

#import "EditCellViewController.h"
#import "ReminderViewController.h"
#import "ToDoViewController.h"
#import "InProgressViewController.h"
#import "TabBarViewController.h"

@interface EditCellViewController ()

@end

@implementation EditCellViewController
{
    int numberOfRows;
    ReminderViewController *reminder;
    NSUserDefaults *ud ;
    NSNumber *indexNumber ;
    NSNumber *indx;
    UIAlertController *alert;
    UIAlertAction *save ;
    UIAlertAction *cancel;
    ToDoViewController *todo ;
    InProgressViewController *inpro ;
    TabBarViewController *tab ;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    printf("edit index == %d \n",_editIndex);
    tab =[self.storyboard instantiateViewControllerWithIdentifier:@"tabVC"];
    _names =[NSMutableArray new];
    _descriptions =[NSMutableArray new] ;
    _priorities=[NSMutableArray new] ;
    _reminders =[NSMutableArray new] ;
    _states=[NSMutableArray new] ;
    _currentDates =[NSMutableArray new] ;
    
    ud=[NSUserDefaults standardUserDefaults];
    inpro =[self.storyboard instantiateViewControllerWithIdentifier:@"inprogressV"];
    todo =[self.storyboard instantiateViewControllerWithIdentifier:@"todoV"];
    numberOfRows =nil;
    self.priorityArry =[[NSArray alloc]initWithObjects:@"High",@"Medium",@"Low",nil];
    self.stateArry =[[NSArray alloc]initWithObjects:@"Done",nil];
    self.stateArry1 =[[NSArray alloc]initWithObjects:@"InProgress",nil];
    self.priorityTable.delegate=self;
    self.priorityTable.dataSource=self;
    self.priorityTable.hidden=YES;
    self.stateTable.delegate=self;
    self.stateTable.dataSource=self;
    self.stateTable.hidden=YES;
    reminder =[self.storyboard instantiateViewControllerWithIdentifier:@"reminderVC"];

    

    
    _taskNameT.text=_nameE;
    _descrT.text=_descE;
    _priorityLabel.text=_priE;
   _reminderLabel.text =_remindE;
    _stateLabel.text=_stateE;
    
    
    
        alert=[UIAlertController alertControllerWithTitle:@"Warning !!" message:@"are you sure to save changes" preferredStyle:UIAlertControllerStyleAlert];
    save =[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        indexNumber =[NSNumber numberWithInt: _editIndex];
        indx =[NSNumber numberWithInt: 55];
        if(_editIndex ==0){
            [ud setObject:indx forKey:@"index"];
        }else{
            [ud setObject:indexNumber forKey:@"index"];
        }
        
        [ud setObject:_taskNameT.text forKey:@"taskname"];
        [ud setObject:_descrT.text forKey:@"desc"];
        [ud setObject:_priorityLabel.text forKey:@"prio"];
        [ud setObject:_reminderLabel.text forKey:@"reminder"];
        [ud setObject:_stateLabel.text forKey:@"state"];
          
        
        
        [self presentViewController:tab animated:YES completion:nil];
       
        //[self.navigationController popToRootViewControllerAnimated:YES];
    }];
    
    
    
    cancel =[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:cancel];
    [alert addAction:save];
    
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_priorityTable) {
        numberOfRows=[self.priorityArry count];
    }else if (tableView==_stateTable){
        if([_stateE isEqualToString:@"ToDo"]){
            numberOfRows=[self.stateArry1 count];
        }else if ([_stateE isEqualToString:@"InProgress"]){
            numberOfRows=[self.stateArry count];
        }else{
            numberOfRows=nil;
        }
        
    }
    return numberOfRows;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier =@"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell ==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    if (tableView==_priorityTable) {
        cell.textLabel.text =[_priorityArry objectAtIndex:indexPath.row];
    }else if (tableView==_stateTable){
        if ([_stateE isEqualToString:@"ToDo"]) {
            cell.textLabel.text =[_stateArry1 objectAtIndex:indexPath.row];
        }else if ([_stateE isEqualToString:@"InProgress"]){
            cell.textLabel.text =[_stateArry objectAtIndex:indexPath.row];
        }else{
            cell.textLabel.text =[_stateArry1 objectAtIndex:indexPath.row];
        }
    }
    return  cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[self.priorityTable cellForRowAtIndexPath:indexPath];
    if (tableView==_priorityTable) {
        [_priorityLabel setText:_priorityArry[indexPath.row]];
        switch (indexPath.row) {
            case 0:
                _priorityLabel.backgroundColor=[UIColor greenColor];
                break;
            case 1 :
                _priorityLabel.backgroundColor=[UIColor blueColor];
                break;
            case 2 :
                _priorityLabel.backgroundColor=[UIColor grayColor];
                break;
        }
    }else if (tableView==_stateTable){
        if([_stateE isEqualToString:@"ToDo"]){
            [_stateLabel setText:_stateArry1[indexPath.row]];
        }else if ([_stateE isEqualToString:@"InProgress"]){
            [_stateLabel setText:_stateArry[indexPath.row]];
        }else{
            [_stateLabel setText:_stateArry1[indexPath.row]];
        }
        
        
        
        
    }
    self.priorityTable.hidden=YES;
    self.stateTable.hidden=YES;
}





- (IBAction)priorityBtn:(id)sender {
    
    if(self.priorityTable.hidden==YES){
        self.priorityTable.hidden=NO;
    }else{
        self.priorityTable.hidden=YES;
    }
}
-(void)TransferDateFromRemToAdd{
    NSDate *mydate =[reminder.datePicker date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:mydate];
    [self.reminderLabel setText:dateString];
}




- (IBAction)stateBtn:(id)sender {
    if(self.stateTable.hidden==YES){
        self.stateTable.hidden=NO;
    }else{
        self.stateTable.hidden=YES;
    }
}

- (IBAction)reminderBtn:(id)sender {
    [reminder setModalPresentationStyle:UIModalPresentationAutomatic];
    [self presentViewController:reminder animated:YES completion:nil];
    [reminder setMyPro:self];
    
}
- (IBAction)saveBtn:(id)sender {
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
}
@end
