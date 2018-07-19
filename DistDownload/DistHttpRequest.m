//
//  DistHttpRequest.m
//  DistDownload
//
//  Created by 吴定如 on 2018/7/19.
//  Copyright © 2018年 Dist. All rights reserved.
//

#import "DistHttpRequest.h"

@interface ZFHttpRequest()<ASIHTTPRequestDelegate,ASIProgressDelegate>
{
    ASIHTTPRequest *_realRequest;
}
@end

@implementation ZFHttpRequest

- (instancetype)initWithURL:(NSURL*)url
{
    self = [super init];
    if (self) {
        _url = url;
        _realRequest = [[ASIHTTPRequest alloc]initWithURL:url];
        _realRequest.delegate = self;
        [_realRequest setDownloadProgressDelegate:self];
        [_realRequest setNumberOfTimesToRetryOnTimeout:2];
        [_realRequest setAllowResumeForFileDownloads:YES];//支持断点续传
        [_realRequest setTimeOutSeconds:30.0f];
        
    }
    return self;
}
- (void)setUserInfo:(NSDictionary *)userInfo
{
    _userInfo = userInfo;
}

- (void)setTag:(NSInteger)tag
{
    _tag = tag;
    _realRequest.tag = tag;
}

- (NSURL*)originalURL
{
    return _realRequest.originalURL;
}

- (NSError*)error
{
    return _realRequest.error;
}

- (BOOL)isFinished
{
    return  [_realRequest isFinished];
}

- (BOOL)isExecuting
{
    return [_realRequest isExecuting];
}

- (void)cancel
{
    [_realRequest clearDelegatesAndCancel];
}

- (void)setDownloadDestinationPath:(NSString *)downloadDestinationPath
{
    _downloadDestinationPath = downloadDestinationPath;
    [_realRequest setDownloadDestinationPath:_downloadDestinationPath];
}

- (void)setTemporaryFileDownloadPath:(NSString *)temporaryFileDownloadPath
{
    _temporaryFileDownloadPath = temporaryFileDownloadPath;
    [_realRequest setTemporaryFileDownloadPath:_temporaryFileDownloadPath];
}

- (void)startAsynchronous
{
    [_realRequest startAsynchronous];
}

#pragma mark - ASIHttpDelegate

- (void)requestStarted:(ASIHTTPRequest *)request
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(requestStarted:)]) {
        [self.delegate requestStarted:self];
    }
}

- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeader
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(request:didReceiveResponseHeaders:)]) {
        [self.delegate request:self didReceiveResponseHeaders:responseHeader];
    }
}

- (void)request:(ZFHttpRequest *)request didReceiveBytes:(long long)bytes
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(request:didReceiveBytes:)]) {
        [self.delegate request:self didReceiveBytes:bytes];
    }
}
- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(request:willRedirectToURL:)]) {
        [self.delegate request:self willRedirectToURL:newURL];
    }
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(requestFinished:)]) {
        [self.delegate requestFinished:self];
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(requestFailed:)]) {
        [self.delegate requestFailed:self];
    }
}

// 全部暂停的时候  request并不retain它们的代理，所以已经释放了代理 而之后request完成了，这将会引起崩溃。大多数情况下，如果你的代理即将被释放，你一定也希望取消所有request，因为你已经不再关心它们的返回情况了，所以得在ZFHttpRequest这个类的dealloc里面加上一个[request clearDelegatesAndCancel];
// 代理类的dealloc函数
- (void)dealloc
{
    //NSLog(@"%@ 释放了",_realRequest);
    [_realRequest clearDelegatesAndCancel];
}

@end
