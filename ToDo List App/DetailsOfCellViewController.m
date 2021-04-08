//
//  DetailsOfCellViewController.m
//  ToDo List App
//
//  Created by Ahmed Badry on 2/28/21.
//

#import "DetailsOfCellViewController.h"
#import "EditCellViewController.h"

@interface DetailsOfCellViewController ()
{
    EditCellViewController *edit ;
}

@end

@implementation DetailsOfCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    edit=[self.storyboard instantiateViewControllerWithIdentifier:@"editVC"];
    edit.editIndex =_detailIndex;
    
    printf("index Detail == %d\n",_detailIndex);
    
    self.taskNameLabel.text = _nameS;
    self.descriptionLabel.text = _descS;
    self.priorityLabel.text = _priS;
    self.reminderLabel.text = _remindS;
    self.stateLabel.text = _stateS;
    
    
    
   
    UIBarButtonItem *editBtn = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Edit"
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(editCell)];
    self.navigationItem.rightBarButtonItem = editBtn;
}






-(void)editCell{
    edit.nameE=self.taskNameLabel.text;
    edit.descE=self.descriptionLabel.text;
    edit.priE=self.priorityLabel.text;
    edit.remindE=self.reminderLabel.text;
    edit.stateE=self.stateLabel.text;
    [self.navigationController pushViewController:edit animated:YES];
}



- (IBAction)cancelBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)okBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
