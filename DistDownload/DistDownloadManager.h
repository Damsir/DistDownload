//
//  DistDownloadManager.h
//  DistDownload
//
//  Created by 吴定如 on 2018/7/19.
//  Copyright © 2018年 Dist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DistCommonHelper.h"
#import "DistDownloadDelegate.h"
#import "DistFileModel.h"
#import "DistHttpRequest.h"

#define kMaxRequestCount  @"kMaxRequestCount"

@interface DistDownloadManager : NSObject<DistHttpRequestDelegate>

/** 获得下载事件的vc，用在比如多选图片后批量下载的情况，这时需配合 allowNextRequest 协议方法使用 */
@property (nonatomic, weak  ) id<DistDownloadDelegate> VCdelegate;
/** 下载列表delegate */
@property (nonatomic, weak  ) id<DistDownloadDelegate> downloadDelegate;
/** 设置最大的并发下载个数 */
@property (nonatomic, assign) NSInteger              maxCount;
/** 已下载完成的文件列表（文件对象） */
@property (atomic, strong, readonly) NSMutableArray  *finishedlist;
/** 正在下载的文件列表(ASIHttpRequest对象) */
@property (atomic, strong, readonly) NSMutableArray  *downinglist;
/** 未下载完成的临时文件数组（文件对象) */
@property (atomic, strong, readonly) NSMutableArray  *filelist;
/** 下载文件的模型 */
@property (nonatomic, strong, readonly) DistFileModel  *fileInfo;

/** 单例 */
+ (DistDownloadManager *)sharedDownloadManager;
/**
 * 清除所有正在下载的请求
 */
- (void)clearAllRquests;
/**
 * 清除所有下载完的文件
 */
- (void)clearAllFinished;
/**
 * 恢复下载
 */
- (void)resumeRequest:(DistHttpRequest *)request;
/**
 * 删除这个下载请求
 */
- (void)deleteRequest:(DistHttpRequest *)request;
/**
 * 停止这个下载请求
 */
- (void)stopRequest:(DistHttpRequest *)request;
/**
 * 保存下载完成的文件信息到plist
 */
- (void)saveFinishedFile;
/**
 * 删除某一个下载完成的文件
 */
- (void)deleteFinishFile:(DistFileModel *)selectFile;
/**
 * 下载视频时候调用
 */
- (void)downFileUrl:(NSString*)url
           filename:(NSString*)name
          fileimage:(UIImage *)image;
/**
 * 开始任务
 */
- (void)startLoad;
/**
 * 全部开始（等于最大下载个数，超过的还是等待下载状态）
 */
- (void)startAllDownloads;
/**
 * 全部暂停
 */
- (void)pauseAllDownloads;

@end
