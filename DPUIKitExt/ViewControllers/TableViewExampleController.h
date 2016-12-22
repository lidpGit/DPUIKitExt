//
//  TableViewExampleController.h
//  UIKitExtensions
//
//  Created by lidp 

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell

@property (copy, nonatomic  ) NSString *title;

@end

@interface TestHeaderView : UITableViewHeaderFooterView

@property (copy, nonatomic  ) NSString *title;

@end

@interface TestFooterView : UITableViewHeaderFooterView

@property (copy, nonatomic  ) NSString *title;

@end

@interface TableViewExampleController : UITableViewController

@end
