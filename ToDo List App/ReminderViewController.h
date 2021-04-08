//
//  ReminderViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/26/21.
//

#import <UIKit/UIKit.h>
#import "myReminderProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface ReminderViewController : UIViewController <myReminderProtocol>
- (IBAction)cancelBtn:(id)sender;
- (IBAction)saveBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property id <myReminderProtocol>myPro;





@end

NS_ASSUME_NONNULL_END
