# DistDownload
文件下载

## 特性
* 支持断点下载
* 异常退出，再次打开保留下载进度
* 实时下载进度
* 实时下载速度

## 要求
* iOS 8+
* Xcode 7+


## 效果图

![图片效果演示](https://github.com/renzifeng/ZFDownload/raw/master/ZFDownload.gif)

## 安装
### Cocoapods

```ruby
pod 'DistDownload'
```

## 使用
```objc
// 设置代理<DistDownloadDelegate>
self.downloadManage.downloadDelegate = self;
// 指定下载URL,文件名称...
[[DistDownloadManager sharedDownloadManager] downFileUrl:urlStr filename:name fileimage:nil];
// 设置最多同时下载个数（默认是3）
[DistDownloadManager sharedDownloadManager].maxCount = 2;

```
在cell上获取实时下载进度，遵守 DistDownloadDelegate代理，然后实现

```objc

#pragma mark - DistDownloadDelegate

// 开始下载
- (void)startDownload:(DistHttpRequest *)request;

// 下载中
- (void)updateCellProgress:(DistHttpRequest *)request;

// 下载完成
- (void)finishedDownload:(DistHttpRequest *)request;


```

# 联系我
- 邮箱: wudr@dist.com.cn
- QQ：  75081647

# License

DistDownload is available under the MIT license. See the LICENSE file for more info.
