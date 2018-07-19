//
//  DistListCell.h
//  DistDownload

#import <UIKit/UIKit.h>

@interface DistListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;
@property (nonatomic, copy) void(^downloadCallBack)(void);

@end
