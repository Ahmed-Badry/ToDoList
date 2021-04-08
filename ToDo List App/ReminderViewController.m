//
//  ReminderViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/26/21.
//

#import "ReminderViewController.h"
#import "AddViewController.h"

@interface ReminderViewController ()

@end

@implementation ReminderViewController
{
    AddViewController *addVC ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    addVC =[[AddViewController alloc]init];
}



- (IBAction)saveBtn:(id)sender {
    NSDate *mydate =[self.datePicker date];
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *dateForm =[format stringFromDate:mydate];
    [_myPro TransferDateFromRemToAdd];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
