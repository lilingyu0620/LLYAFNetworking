//
//  ViewController.m
//  LLYAFNetworking
//
//  Created by lly on 2018/6/8.
//  Copyright © 2018年 lly. All rights reserved.
//

#import "ViewController.h"
#import "LLYAAA.h"
#import "LLYBBB.h"
#import "LLYHttpSessionManager.h"

static NSString const * kTestUrl = @"http://open-image.nosdn1.127.net/0fe8cbb172dd4f92a855e595de7026e6.jpg";

static NSString const * kTestUrl2 = @"http://test1.c.open.163.com/open/trade/mob/course/detail.do?courseId=7";

static NSString const * kTestUrl3 = @"http://nos.netease.com/test-open-audio/nos/mp3/2018/04/17/ZDEMIAA6S_shd.mp3";

static NSString const * kTestUrl4 = @"http://nos.netease.com/test-open-movie/nos/mp4/2018/04/04/ZDDKH9303_sd.mp4";


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [LLYAAA printAllMethod];
    [LLYBBB printAllMethod];
    
    LLYAAA *aaa = [LLYAAA new];
    [aaa aaa_hateMe];
    [aaa aaa_loveMe];
    LLYBBB *bbb = [LLYBBB new];
    [bbb bbb_hateMe];
    [bbb bbb_loveMe];
    
    
    [LLYHttpSessionManager shareInstance].didReceiveResponseBlock = ^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSURLResponse *response) {
        NSLog(@"dataTask = %lu",(unsigned long)dataTask.taskIdentifier);
    };
    
    [LLYHttpSessionManager shareInstance].didReceiveDataBlock = ^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data) {
        NSLog(@"dataTask = %lu,data = %@",(unsigned long)dataTask.taskIdentifier,data);
    };
    
//
//    [[LLYHttpSessionManager shareInstance] requestWithMethod:LLYHttpMethod_GET fileType:LLYHttpFileType_AUDIO urlString:kTestUrl3 parameters:nil progress:^(NSProgress *downloadProgress) {
//        NSLog(@"totalunit = %lld,completeunit = %lld",downloadProgress.totalUnitCount,downloadProgress.completedUnitCount);
//
//    } success:^(NSURLSessionDataTask *task, id  _Nullable responseObject) {
//        NSLog(@"success!!!!!");
//        NSLog(@"taskid = %lu",(unsigned long)task.taskIdentifier);
//        NSLog(@"countOfBytesSent = %lld",task.countOfBytesSent);
//        NSLog(@"countOfBytesReceived = %lld",task.countOfBytesReceived);
//        NSLog(@"countOfBytesExpectedToSend = %lld",task.countOfBytesExpectedToSend);
//        NSLog(@"countOfBytesExpectedToReceive = %lld",task.countOfBytesExpectedToReceive);
//
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError *error) {
//        NSLog(@"failure!!!!!!");
//        NSLog(@"taskid = %lu",(unsigned long)task.taskIdentifier);
//    }];
    
    
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *fileDoc = [NSString stringWithFormat:@"%@/Download",libraryPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileDoc]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:fileDoc withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *filePath = [NSString stringWithFormat:@"%@/downloadfile.mp3",fileDoc];

    NSURLSessionDownloadTask *task = [[LLYHttpSessionManager shareInstance] downloadWithUrl:kTestUrl3 progress:^(NSProgress *downloadProgress) {
        NSLog(@"totalunit = %lld,completeunit = %lld",downloadProgress.totalUnitCount,downloadProgress.completedUnitCount);
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse *response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"completion!!!!!!");
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
