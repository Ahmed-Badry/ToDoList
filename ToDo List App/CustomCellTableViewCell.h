//
//  CustomCellTableViewCell.h
//  ToDo List App
//
//  Created by Ahmed Badry on 2/26/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgCell;
@property (weak, nonatomic) IBOutlet UILabel *dateCell;
@property (weak, nonatomic) IBOutlet UILabel *titleCell;
@property (weak, nonatomic) IBOutlet UILabel *prioCell;



@end

NS_ASSUME_NONNULL_END
