//
//  AddViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/26/21.
//

#import "AddViewController.h"
#import "ReminderViewController.h"
#import "InProgressViewController.h"
#import "ToDoViewController.h"


@interface AddViewController ()

@end

@implementation AddViewController
{
    int numberOfRows;
    ReminderViewController *reminder;
    ToDoViewController *todo ;
    InProgressViewController *inpro ;
   NSUserDefaults *ud;
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    inpro=[self.storyboard instantiateViewControllerWithIdentifier:@"inprogressV"];
    numberOfRows=nil;
    self.priorityArry =[[NSArray alloc]initWithObjects:@"High",@"Medium",@"Low",nil];
    self.stateArry =[[NSArray alloc]initWithObjects:@"ToDo",nil];
    self.priorityTable.delegate=self;
    self.priorityTable.dataSource=self;
    self.priorityTable.hidden=YES;
    self.stateTable.delegate=self;
    self.stateTable.dataSource=self;
    self.stateTable.hidden=YES;
    reminder =[self.storyboard instantiateViewControllerWithIdentifier:@"reminderVC"];

    if (_names==nil) {
        _names =[[NSMutableArray alloc]init];
        _descriptions =[[NSMutableArray alloc]init];
        _priorities =[[NSMutableArray alloc]init];
        _reminders =[[NSMutableArray alloc]init];
        _states =[[NSMutableArray alloc]init];
        _currentDates =[[NSMutableArray alloc]init];
    }
    ud=[NSUserDefaults standardUserDefaults];
    todo=[self.storyboard instantiateViewControllerWithIdentifier:@"todoV"];
        
    
    
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==_priorityTable) {
        numberOfRows=[self.priorityArry count];
    }else if (tableView==_stateTable){
        numberOfRows=[self.stateArry count];
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
        cell.textLabel.text =[_stateArry objectAtIndex:indexPath.row];
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
        [_stateLabel setText:_stateArry[indexPath.row]];
    }
    self.priorityTable.hidden=YES;
    self.stateTable.hidden=YES;
}





- (IBAction)stateBtn:(id)sender {
    if(self.stateTable.hidden==YES){
        self.stateTable.hidden=NO;
    }else{
        self.stateTable.hidden=YES;
    }
}



- (IBAction)priorityBtn:(id)sender {
    if(self.priorityTable.hidden==YES){
        self.priorityTable.hidden=NO;
    }else{
        self.priorityTable.hidden=YES;
    }
    
}



- (IBAction)addBtn:(id)sender {
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *currentDate = [NSDate date];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    
    [_names addObject:_nameTextField.text];
    [_descriptions addObject:_descTextField.text];
    [_priorities addObject:_priorityLabel.text];
    [_reminders addObject:_reminderLabel.text];
    [_currentDates addObject:dateString];
    NSString *stateL;
    stateL = _stateLabel.text;
    if ([stateL isEqualToString:@""]) {
        [_states addObject:@"ToDo"];
    }else{
        [_states addObject:_stateLabel.text];
    }
    
    
    [_myArrP transArrFromAddToToDo];
 
    
    _nameTextField.text =@"";
    _descTextField.text =@"";
    _priorityLabel.text=@"";
    _reminderLabel.text=@"";
    _stateLabel.text=@"";
    _priorityLabel.backgroundColor=nil;
   
    [self.navigationController popViewControllerAnimated:YES];
   
}





- (IBAction)cancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)reminderBtn:(id)sender {
   
    [reminder setModalPresentationStyle:UIModalPresentationAutomatic];
    [self presentViewController:reminder animated:YES completion:nil];
    [reminder setMyPro:self];
}


-(void)TransferDateFromRemToAdd{
    NSDate *mydate =[reminder.datePicker date];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateString = [dateFormatter stringFromDate:mydate];
    [self.reminderLabel setText:dateString];
}
@end
