//
//  DistDownloadDelegate.h
//  DistDownload
//
//  Created by 吴定如 on 2018/7/19.
//  Copyright © 2018年 Dist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DistHttpRequest.h"

@protocol DistDownloadDelegate <NSObject>

@optional
- (void)startDownload:(DistHttpRequest *)request;
- (void)updateCellProgress:(DistHttpRequest *)request;
- (void)finishedDownload:(DistHttpRequest *)request;
- (void)allowNextRequest;//处理一个窗口内连续下载多个文件且重复下载的情况

@end
