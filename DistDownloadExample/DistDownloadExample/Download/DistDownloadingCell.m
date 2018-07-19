//
//  DistDownloadingCell.m

#import "DistDownloadingCell.h"

@interface DistDownloadingCell ()

@end

@implementation DistDownloadingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 *  暂停、下载
 *
 *  @param sender UIButton
 */
- (IBAction)clickDownload:(UIButton *)sender {
    // 执行操作过程中应该禁止该按键的响应 否则会引起异常
    sender.userInteractionEnabled = NO;
    DistFileModel *downFile = self.fileInfo;
    DistDownloadManager *filedownmanage = [DistDownloadManager sharedDownloadManager];
    if(downFile.downloadState == DistDownloading) { //文件正在下载，点击之后暂停下载 有可能进入等待状态
        self.downloadBtn.selected = YES;
        [filedownmanage stopRequest:self.request];
    } else {
        self.downloadBtn.selected = NO;
        [filedownmanage resumeRequest:self.request];
    }
    
    // 暂停意味着这个Cell里的ASIHttprequest已被释放，要及时更新table的数据，使最新的ASIHttpreqst控制Cell
    if (self.btnClickBlock) {
        self.btnClickBlock();
    }
    sender.userInteractionEnabled = YES;

}

/**
 *  model setter
 *
 *  @param sessionModel sessionModel 
 */
- (void)setFileInfo:(DistFileModel *)fileInfo
{
    _fileInfo = fileInfo;
    self.fileNameLabel.text = fileInfo.fileName;
    // 服务器可能响应的慢，拿不到视频总长度 && 不是下载状态
    if ([fileInfo.fileSize longLongValue] == 0 && !(fileInfo.downloadState == DistDownloading)) {
        self.progressLabel.text = @"";
        if (fileInfo.downloadState == DistStopDownload) {
            self.speedLabel.text = @"已暂停";
        } else if (fileInfo.downloadState == DistWillDownload) {
            self.downloadBtn.selected = YES;
            self.speedLabel.text = @"等待下载";
        }
        self.progress.progress = 0.0;
        return;
    }
    NSString *currentSize = [DistCommonHelper getFileSizeString:fileInfo.fileReceivedSize];
    NSString *totalSize = [DistCommonHelper getFileSizeString:fileInfo.fileSize];
    // 下载进度
    float progress = (float)[fileInfo.fileReceivedSize longLongValue] / [fileInfo.fileSize longLongValue];
    
    self.progressLabel.text = [NSString stringWithFormat:@"%@ / %@ (%.2f%%)",currentSize, totalSize, progress*100];
    
    self.progress.progress = progress;
    
    // NSString *spped = [NSString stringWithFormat:@"%@/S",[DistCommonHelper getFileSizeString:[NSString stringWithFormat:@"%lu",[ASIHTTPRequest averageBandwidthUsedPerSecond]]]];
    if (fileInfo.speed) {
        NSString *speed = [NSString stringWithFormat:@"%@ 剩余%@",fileInfo.speed,fileInfo.remainingTime];
        self.speedLabel.text = speed;
    } else {
        self.speedLabel.text = @"正在获取";
    }
    
    if (fileInfo.downloadState == DistDownloading) { //文件正在下载
        self.downloadBtn.selected = NO;
    } else if (fileInfo.downloadState == DistStopDownload&&!fileInfo.error) {
        self.downloadBtn.selected = YES;
        self.speedLabel.text = @"已暂停";
    }else if (fileInfo.downloadState == DistWillDownload&&!fileInfo.error) {
        self.downloadBtn.selected = YES;
        self.speedLabel.text = @"等待下载";
    } else if (fileInfo.error) {
        self.downloadBtn.selected = YES;
        self.speedLabel.text = @"错误";
    }
    
}



@end
