//
//  EditCellViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/28/21.
//

#import <UIKit/UIKit.h>
#import "myReminderProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditCellViewController : UIViewController <UITableViewDataSource ,UITableViewDelegate ,myReminderProtocol>
@property NSString *nameE;
@property NSString *descE;
@property NSString *priE;
@property NSString *remindE;
@property NSString *stateE;
@property (weak, nonatomic) IBOutlet UITextField *taskNameT;
@property (weak, nonatomic) IBOutlet UITextView *descrT;
@property (weak, nonatomic) IBOutlet UITableView *priorityTable;
- (IBAction)priorityBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *reminderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
- (IBAction)reminderBtn:(id)sender;
- (IBAction)stateBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *stateTable;
@property(strong,nonatomic) NSArray *priorityArry ;
@property(strong,nonatomic) NSArray *stateArry ;
@property(strong,nonatomic) NSArray *stateArry1 ;
@property(strong,nonatomic)NSMutableArray *names ;
@property(strong,nonatomic)NSMutableArray *descriptions ;
@property(strong,nonatomic)NSMutableArray *priorities ;
@property(strong,nonatomic)NSMutableArray *reminders ;
@property(strong,nonatomic)NSMutableArray *states ;
@property(strong,nonatomic)NSMutableArray *currentDates ;

- (IBAction)saveBtn:(id)sender;
@property NSInteger editIndex ;


@end

NS_ASSUME_NONNULL_END
