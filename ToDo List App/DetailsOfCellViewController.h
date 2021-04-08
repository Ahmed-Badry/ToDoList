//
//  DetailsOfCellViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/28/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailsOfCellViewController : UIViewController

@property NSString *nameS;
@property NSString *descS;
@property NSString *priS;
@property NSString *remindS;
@property NSString *stateS;

-(void)editCell ;
@property (weak, nonatomic) IBOutlet UILabel *taskNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *reminderLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
- (IBAction)okBtn:(id)sender;
- (IBAction)cancelBtn:(id)sender;

@property int detailIndex ;


@end

NS_ASSUME_NONNULL_END
