//
//  DistDownloadedCell.h

#import <UIKit/UIKit.h>
#import "DistDownloadManager.h"

@interface DistDownloadedCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

/** 下载信息模型 */
@property (nonatomic, strong) DistFileModel *fileInfo;

@end
