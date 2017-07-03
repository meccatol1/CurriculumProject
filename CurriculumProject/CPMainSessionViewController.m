//
//  CPMainSessionViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 7. 3..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPMainSessionViewController.h"

typedef void (^CompletionHandler)();

@interface MySessionDelegate : NSObject <NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate, NSURLSessionStreamDelegate>

@property NSMutableDictionary <NSString *, CompletionHandler>*completionHandlers;

@end

@implementation MySessionDelegate

@end

@interface CPMainSessionViewController ()

@end

@implementation CPMainSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self urlSessionTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)urlSessionTest {
    NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSessionConfiguration *ephemeralConfiguration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    NSURLSessionConfiguration *backgroundConfiguration = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier: @"com.myapp.networking.background"];
    
    NSString *cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    NSString *cachePath = [cachesDirectory stringByAppendingPathComponent:@"MyCache"];
    NSLog(@"cachesDirectory = %@", cachesDirectory);
    NSLog(@"cachePath = %@", cachePath);
    
    NSString *cachesDirectory2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSLocalDomainMask, YES).firstObject;
    NSLog(@"cachesDirectory2 = %@", cachesDirectory2);
    NSString *cachesDirectory3 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSNetworkDomainMask, YES).firstObject;
    NSLog(@"cachesDirectory3 = %@", cachesDirectory3);
    NSString *cachesDirectory4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSAllDomainsMask, YES).firstObject;
    NSLog(@"cachesDirectory4 = %@", cachesDirectory4);
    
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:16384 diskCapacity:268435456 diskPath:cachePath];
    defaultConfiguration.URLCache = cache;
    defaultConfiguration.requestCachePolicy = NSURLRequestUseProtocolCachePolicy;
    
    id <NSURLSessionDelegate> delegate = [[MySessionDelegate alloc] init];
    NSOperationQueue *operationQueue = [NSOperationQueue mainQueue];

    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfiguration
                                                                 delegate:delegate
                                                            delegateQueue:operationQueue];
//    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultConfiguration
//                                                                 delegate:delegate
//                                                           operationQueue:operationQueue];
    NSURLSession *ephemeralSession = [NSURLSession sessionWithConfiguration:ephemeralConfiguration
                                                                   delegate:delegate
                                                              delegateQueue:operationQueue];
    NSURLSession *backgroundSession = [NSURLSession sessionWithConfiguration:backgroundConfiguration
                                                                    delegate:delegate
                                                               delegateQueue:operationQueue];
    
    ephemeralConfiguration.allowsCellularAccess = NO;
    NSURLSession *ephemeralSessionWiFiOnly = [NSURLSession sessionWithConfiguration:ephemeralConfiguration delegate:delegate delegateQueue:operationQueue];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
