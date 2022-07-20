//
//  BaseModel.m
//  LemonHardware
//
//  
//  Copyright © 2019 Tencent. All rights reserved.
//

#import "BaseModel.h"
#import <QMCoreFunction/McCoreFunction.h>

@implementation BaseModel

-(BOOL)getHardWareInfo{
    return NO;
}

-(NSString *)getHardWareInfoPathByName:(NSString *)hardWareName{
    NSString *appSuppPath = [self getApplicationSupportPath];
    NSString *filePath = [appSuppPath stringByAppendingPathComponent:hardWareName];
    //    NSLog(@"dbPath = %@", dbPath);
    return filePath;
}

-(NSString *)getApplicationSupportPath{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSString *bundleId = [[NSBundle mainBundle] bundleIdentifier];
    NSArray *urlPaths = [fileManager URLsForDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
    NSURL *appDirectory = [[urlPaths objectAtIndex:0] URLByAppendingPathComponent:bundleId isDirectory:YES];
    
    if (![fileManager fileExistsAtPath:[appDirectory path]]) {
        [fileManager createDirectoryAtURL:appDirectory withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    //NSLog(@"app path is = %@", appDirectory);
    
    return [appDirectory path];
}

-(NSString *)getValueForkey:(NSString *)key withString:(NSString *)configStr{
    if ([configStr containsString:key]) {
        NSString *tempString = [configStr stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@:",key] withString:@""];
        tempString = [tempString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        if ((tempString == nil) || [tempString isEqualToString:@""]) {
            return nil;
        }
        return tempString;
    }
    
    return nil;
}

@end
