//
//  DistHttpRequest.h
//  DistDownload
//
//  Created by 吴定如 on 2018/7/19.
//  Copyright © 2018年 Dist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ASIHTTPRequest/ASIHTTPRequest.h>

@class DistHttpRequest;

@protocol DistHttpRequestDelegate <NSObject>

- (void)requestFailed:(DistHttpRequest *)request;
- (void)requestStarted:(DistHttpRequest *)request;
- (void)request:(DistHttpRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders;
- (void)request:(DistHttpRequest *)request didReceiveBytes:(long long)bytes;
- (void)requestFinished:(DistHttpRequest *)request;
@optional
- (void)request:(DistHttpRequest *)request willRedirectToURL:(NSURL *)newURL;

@end

@interface DistHttpRequest : NSObject
@property (weak, nonatomic  ) id<DistHttpRequestDelegate> delegate;
@property (strong, nonatomic) NSURL                  *url;
@property (strong, nonatomic) NSURL                  *originalURL;
@property (strong, nonatomic) NSDictionary           *userInfo;
@property (assign, nonatomic) NSInteger              tag;
@property (copy, nonatomic) NSString                 *downloadDestinationPath;
@property (copy, nonatomic) NSString                 *temporaryFileDownloadPath;
@property (strong,readonly,nonatomic) NSError *error;

- (instancetype)initWithURL:(NSURL*)url;
- (void)startAsynchronous;
- (BOOL)isFinished;
- (BOOL)isExecuting;
- (void)cancel;

@end
