//
//  DistCommonHelper.h
//  DistDownload
//
//  Created by 吴定如 on 2018/7/19.
//  Copyright © 2018年 Dist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 下载文件的总文件夹
#define BASE       @"DistDownLoad"
// 完整文件路径
#define TARGET     @"CacheList"
// 临时文件夹名称
#define TEMP       @"Temp"
// 缓存主目录
#define CACHES_DIRECTORY     [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
// 临时文件夹的路径
#define TEMP_FOLDER          [NSString stringWithFormat:@"%@/%@/%@",CACHES_DIRECTORY,BASE,TEMP]
// 临时文件的路径
#define TEMP_PATH(name)      [NSString stringWithFormat:@"%@/%@",[DistCommonHelper createFolder:TEMP_FOLDER],name]
// 下载文件夹路径
#define FILE_FOLDER          [NSString stringWithFormat:@"%@/%@/%@",CACHES_DIRECTORY,BASE,TARGET]
// 下载文件的路径
#define FILE_PATH(name)      [NSString stringWithFormat:@"%@/%@",[DistCommonHelper createFolder:FILE_FOLDER],name]
// 文件信息的Plist路径
#define PLIST_PATH           [NSString stringWithFormat:@"%@/%@/FinishedPlist.plist",CACHES_DIRECTORY,BASE]

@interface DistCommonHelper : NSObject

/** 将文件大小转化成M单位或者B单位 */
+ (NSString *)getFileSizeString:(NSString *)size;
/** 经文件大小转化成不带单位的数字 */
+ (float)getFileSizeNumber:(NSString *)size;
/** 字符串格式化成日期 */
+ (NSDate *)makeDate:(NSString *)birthday;
/** 日期格式化成字符串 */
+ (NSString *)dateToString:(NSDate*)date;
/** 检查文件名是否存在 */
+ (BOOL)isExistFile:(NSString *)fileName;
+ (NSString *)createFolder:(NSString *)path;

+ (CGFloat)calculateFileSizeInUnit:(unsigned long long)contentLength;
+ (NSString *)calculateUnit:(unsigned long long)contentLength;

@end
