//
//  DistListCell.m
//  DistDownload

#import "DistListCell.h"

@implementation DistListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)downloadAction:(UIButton *)sender {
    if (self.downloadCallBack) { self.downloadCallBack(); }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
