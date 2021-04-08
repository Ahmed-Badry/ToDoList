//
//  DoneViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/25/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DoneViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableV;

@property(strong,nonatomic)NSMutableArray *namesP ;
@property(strong,nonatomic)NSMutableArray *descriptionsP ;
@property(strong,nonatomic)NSMutableArray *prioritiesP ;
@property(strong,nonatomic)NSMutableArray *remindersP ;
@property(strong,nonatomic)NSMutableArray *statesP ;
@property(strong,nonatomic)NSMutableArray *currentDatesP ;

@property(strong,nonatomic)NSMutableArray *names ;
@property(strong,nonatomic)NSMutableArray *descriptions ;
@property(strong,nonatomic)NSMutableArray *priorities ;
@property(strong,nonatomic)NSMutableArray *reminders ;
@property(strong,nonatomic)NSMutableArray *states ;
@property(strong,nonatomic)NSMutableArray *currentDates ;


@property(strong,nonatomic)NSMutableArray *checknames ;
@property(strong,nonatomic)NSMutableArray *checkdescriptions ;
@property(strong,nonatomic)NSMutableArray *checkpriorities ;
@property(strong,nonatomic)NSMutableArray *checkreminders ;
@property(strong,nonatomic)NSMutableArray *checkstates ;
@property(strong,nonatomic)NSMutableArray *checkcurrentDates ;

@property(strong,nonatomic)NSMutableArray *arrayOfIndexs ;

@end

NS_ASSUME_NONNULL_END
