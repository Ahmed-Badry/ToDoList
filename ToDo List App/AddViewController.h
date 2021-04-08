//
//  AddViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/26/21.
//

#import <UIKit/UIKit.h>
#import "myReminderProtocol.h"
#import "MyArraiesProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController :  UIViewController <UITableViewDataSource ,UITableViewDelegate ,myReminderProtocol>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *descTextField;

- (IBAction)cancel:(id)sender;
- (IBAction)addBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *priorityTable;
@property (weak, nonatomic) IBOutlet UITableView *stateTable;
- (IBAction)priorityBtn:(id)sender ;
- (IBAction)stateBtn:(id)sender;
@property(strong,nonatomic) NSArray *priorityArry ;
@property(strong,nonatomic) NSArray *stateArry ;
@property(strong,nonatomic)NSMutableArray *names ;
@property(strong,nonatomic)NSMutableArray *descriptions ;
@property(strong,nonatomic)NSMutableArray *priorities ;
@property(strong,nonatomic)NSMutableArray *reminders ;
@property(strong,nonatomic)NSMutableArray *states ;
@property(strong,nonatomic)NSMutableArray *currentDates ;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
- (IBAction)reminderBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *reminderLabel;
-(void)TransferDateFromRemToAdd;
@property id <MyArraiesProtocol>myArrP;



@end

NS_ASSUME_NONNULL_END
