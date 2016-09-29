//
//  main.m
//  replaceFileName
//  Assets.car 文件名加工替换程序
//
//  使用: 命令 目录 需要替换的字符串
//
//  Created by hans on 16/9/29.
//  Copyright © 2016年 yuu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        if(argc < 3){
            NSLog(@"缺少参数");
            return 0;
        }
        
        NSLog(@"filePath : %s , replaceTitle : %s", argv[1], argv[2]);
        
        NSString *filePath = [[NSString stringWithUTF8String:argv[1]] stringByAppendingString:@"/"];
        NSString *replaceTitle = [NSString stringWithUTF8String:argv[2]];
        
//        NSString *filePath = @"/Users/hans/Documents/IOS-APP-解包分析/爱奇艺/未命名文件夹/";
//        NSString *replaceTitle = @"_58C89562F58FD276F592420068DB8C09_0";
        
        NSFileManager *localFileManager=[[NSFileManager alloc] init];
        NSDirectoryEnumerator *dirEnum = [localFileManager enumeratorAtPath:filePath];
        
        NSString *file;
        while ((file = [dirEnum nextObject])) {
            
            if((![[file pathExtension] isEqualToString:@"png"])
               &&(![[file pathExtension] isEqualToString:@"jpg"])){
                NSLog(@"pass : %@", file);
                continue;
            }
            
            NSLog(@"file : %@", file);
            
            [[NSFileManager alloc]
                moveItemAtPath:[filePath stringByAppendingString:file]
                toPath:[filePath stringByAppendingString:[file stringByReplacingOccurrencesOfString:replaceTitle withString:@""]]
                error:nil];
        }
        
        NSLog(@"------- end -------");
    }
    return 0;
}
