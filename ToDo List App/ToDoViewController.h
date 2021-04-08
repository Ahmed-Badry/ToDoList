//
//  ToDoViewController.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/25/21.
//

#import <UIKit/UIKit.h>
#import "MyArraiesProtocol.h"
#import "AddViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoViewController : UIViewController <UITableViewDelegate ,UITableViewDataSource,MyArraiesProtocol ,UITabBarDelegate ,UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableV;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;










- (IBAction)addTask:(id)sender;

@property(strong,nonatomic)NSMutableArray *names ;
@property(strong,nonatomic)NSMutableArray *descriptions ;
@property(strong,nonatomic)NSMutableArray *priorities ;
@property(strong,nonatomic)NSMutableArray *reminders ;
@property(strong,nonatomic)NSMutableArray *states ;
@property(strong,nonatomic)NSMutableArray *currentDates ;
@property(strong,nonatomic)NSMutableArray *arrayOfIndexes;


@end

NS_ASSUME_NONNULL_END
