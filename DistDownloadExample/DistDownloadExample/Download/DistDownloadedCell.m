//
//  DistDownloadedCell.m

#import "DistDownloadedCell.h"

@implementation DistDownloadedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFileInfo:(DistFileModel *)fileInfo
{
    _fileInfo = fileInfo;
    NSString *totalSize = [DistCommonHelper getFileSizeString:fileInfo.fileSize];
    self.fileNameLabel.text = fileInfo.fileName;
    self.sizeLabel.text = totalSize;
}

@end
