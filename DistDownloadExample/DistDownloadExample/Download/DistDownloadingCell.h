//
//  DistDownloadingCell.h

#import <UIKit/UIKit.h>
#import "DistDownloadManager.h"

typedef void(^DistBtnClickBlock)(void);

@interface DistDownloadingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fileNameLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadBtn;

/** 下载按钮点击回调block */
@property (nonatomic, copy  ) DistBtnClickBlock  btnClickBlock;
/** 下载信息模型 */
@property (nonatomic, strong) DistFileModel      *fileInfo;
/** 该文件发起的请求 */
@property (nonatomic,retain ) DistHttpRequest    *request;

@end
