//
//  AppDelegate.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 16..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "AppDelegate.h"

#import "SubViewController.h"

#import "SnapShotViewController.h"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface AppDelegate ()

@property NSOperationQueue *queue;
@property SnapShotViewController *snapshotController;

@end

@implementation AppDelegate

// Window와 RootViewController는 Storyboard에서 생성하고 넣어줌~

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"willFinishLaunchingWithOptions = %@", launchOptions);
    // hot fix fix test 1.0.0.9
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"didFinishLaunchingWithOptions = %@", launchOptions);
    
    self.queue = [NSOperationQueue currentQueue];
    
//    UIApplication *app = [UIApplication sharedApplication];
//    NSArray *oldNotifications = [app scheduledLocalNotifications];
//    
//    // Clear out the old notification before scheduling a new one.
//    if ([oldNotifications count] > 0)
//        [app cancelAllLocalNotifications];
    
    if (SYSTEM_VERSION_LESS_THAN(@"10.0")) {
        UIApplication *app = [UIApplication sharedApplication];
        
        UILocalNotification* alarm = [[UILocalNotification alloc] init];
        if (alarm)
        {
            alarm.fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
            alarm.timeZone = [NSTimeZone defaultTimeZone];
            alarm.repeatInterval = 0;
            alarm.soundName = @"alarmsound.caf";
            alarm.alertTitle = @"TITLE!!!";
            alarm.alertBody = @"Time to wake up!";
            
            [app scheduleLocalNotification:alarm];
        }
    }else {
        UNNotificationAction *action1 =
        [UNNotificationAction actionWithIdentifier:@"action1"
                                             title:@"title_a1"
                                           options:(UNNotificationActionOptionAuthenticationRequired)];
        UNNotificationAction *action2 =
        [UNNotificationAction actionWithIdentifier:@"action2"
                                             title:@"title_a2"
                                           options:(UNNotificationActionOptionDestructive)];
        UNNotificationAction *action3 =
        [UNNotificationAction actionWithIdentifier:@"action3"
                                             title:@"title_a3"
                                           options:(UNNotificationActionOptionForeground)];
        UNNotificationCategory *category =
        [UNNotificationCategory categoryWithIdentifier:@"ActionCategory"
                                               actions:@[action1, action2, action3]
                                     intentIdentifiers:@[]
                                               options:UNNotificationCategoryOptionCustomDismissAction];
        
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center setNotificationCategories:[NSSet setWithArray:@[category]]];
        
        [center requestAuthorizationWithOptions:UNAuthorizationOptionAlert|UNAuthorizationOptionSound
                              completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                  
                              }];
//        UNMutableNotificationContent *content = [UNMutableNotificationContent new];
//        content.title = @"title";
//        content.body = @"body";
//        content.categoryIdentifier = @"ActionCategory";
//        
//        UNNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
//        
//        UNNotificationRequest *request =
//        [UNNotificationRequest requestWithIdentifier:@"localNoti"
//                                             content:content
//                                             trigger:trigger];
//        
//        [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//            
//        }];
    }
    
//    [application setMinimumBackgroundFetchInterval:60*20];
    
//    application.applicationState
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

//static UIBackgroundTaskIdentifier bgTask;

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"applicationDidEnterBackground");
    
//    if (self.snapshotController == nil) {
//        self.snapshotController = [[SnapShotViewController alloc] initWithNibName:@"SnapShotViewController" bundle:nil];
//    }
//    if (self.snapshotController) {
//        [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:self.snapshotController
//                                                                                         animated:NO
//                                                                                       completion:^{
//                                                                                           NSLog(@"snapshot 보여줌");
//                                                                                       }];
//    }
//    
//    
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    
//    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
//    content.title = @"title";
//    content.body = @"Background!!";
//    content.categoryIdentifier = @"ActionCategory";
//    
//    UNNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
//    
//    UNNotificationRequest *request =
//    [UNNotificationRequest requestWithIdentifier:@"localNoti"
//                                         content:content
//                                         trigger:trigger];
//    
//    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        NSLog(@"addNotificationRequest withCompletionHandler");
//    }];

    // 30분까지 가는건 테스트 함
//    NSTimeInterval remaining = [application backgroundTimeRemaining];
//    for (int i = 0; i < 3600*2; i++) {
//        NSLog(@"background task = %zd, %f", i, remaining);
//        [NSThread sleepForTimeInterval:1];
//    }
    
//    bgTask = [application beginBackgroundTaskWithName:@"MyTask" expirationHandler:^{
//        NSLog(@"applicationDidEnterBackground expireHandler");
//        [application endBackgroundTask:bgTask];
//        bgTask = UIBackgroundTaskInvalid;
//    }];
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSTimeInterval remaining = [application backgroundTimeRemaining];
//        // do somethings
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"background task = %zd, %f", i, remaining);
//            [NSThread sleepForTimeInterval:1];
//        }
//        
//        [application endBackgroundTask:bgTask];
//        NSLog(@"applicationDidEnterBackground endBacgroundTask");
//        bgTask = UIBackgroundTaskInvalid;
//    });
}
/*
 NSTimeInterval remaining = [application backgroundTimeRemaining];
 일반적? 으로는 모르겠지만 지금은 180초가 반환된다.
 반환되서 작업 진행중에 메모리 많이 먹는 작업 (유투브, 페이스북) 열심히 했더니 161초만에 작업 끝나고, expireHandler불렸다
 
 expireHandler 불린다고 하더라도 비동기 작업이 끝나지는 않는다. 비동기 작업이(백그라운드 작업이 끝날수있게 컨트롤 해놔야 할 것
*/

//- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    NSLog(@"performFetchWithCompletionHandler");
//    
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    
//    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
//    content.title = @"title";
//    content.body = @"BackgroundFetch!!";
//    content.categoryIdentifier = @"ActionCategory";
//    
//    UNNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
//    
//    UNNotificationRequest *request =
//    [UNNotificationRequest requestWithIdentifier:@"localNoti"
//                                         content:content
//                                         trigger:trigger];
//    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
//        NSLog(@"addNotificationRequest withCompletionHandler");
//    }];
//    
//    for (int i = 0; i < 5; i++) {
//        NSLog(@"fetch task = %zd", i);
//        [NSThread sleepForTimeInterval:1];
//    }
//    completionHandler(UIBackgroundFetchResultNewData);
//}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
    
    if (self.snapshotController) {
        [self.snapshotController dismissViewControllerAnimated:NO
                                                    completion:^{
                                                        NSLog(@"snapshot dismiss");
                                                    }];
        self.snapshotController = nil;
    }
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"applicationWillTerminate");
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}
#pragma mark - NSURLSession Background Task
- (void)application:(UIApplication *)application
handleEventsForBackgroundURLSession:(NSString *)identifier
  completionHandler:(void (^)())completionHandler {
    
    NSURLSessionConfiguration *configuration =
    [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"bg_task"];
    
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:configuration
                                  delegate:[SubViewController sharedInstance]
                             delegateQueue:[NSOperationQueue mainQueue]];
    
    // CompletionHandler를 할당하지 않고 delegate 할당해서 사용해야 한다~
    // 또한 지금 이 코드가 먹히는것도 아님
    [session getTasksWithCompletionHandler:^(NSArray<NSURLSessionDataTask *> * _Nonnull dataTasks, NSArray<NSURLSessionUploadTask *> * _Nonnull uploadTasks, NSArray<NSURLSessionDownloadTask *> * _Nonnull downloadTasks) {
        
    }];
    
    completionHandler();
}

#pragma mark - Preserve & Restore
- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
//    [coder decodeObjectForKey:UIApplicationStateRestoration]
    NSLog(@"shouldSaveApplicationState");
    return YES;
}
- (void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"willEncodeRestorableStateWithCoder");
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    NSLog(@"shouldRestoreApplicationState");
    NSString *osVersion = [coder decodeObjectForKey:UIApplicationStateRestorationSystemVersionKey];
    NSDate *date = [coder decodeObjectForKey:UIApplicationStateRestorationTimestampKey];
    NSString *appVersion = [coder decodeObjectForKey:UIApplicationStateRestorationBundleVersionKey];
    NSNumber *idiom = [coder decodeObjectForKey:UIApplicationStateRestorationUserInterfaceIdiomKey];
    NSLog(@"%@, %@, %@, %@", osVersion, date, appVersion, idiom);
    return NO;
}
- (void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder {
    NSLog(@"didDecodeRestorableStateWithCoder");
}
- (UIViewController *)application:(UIApplication *)application viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents coder:(NSCoder *)coder {
    NSLog(@"viewControllerWithRestorationIdentifierPath %@", identifierComponents);
    UIViewController *controller = nil;
    return controller;
}

#pragma mark - openURL
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    NSLog(@"openURL = %@, options = %@", url, options);
    
    return YES;
}

#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CurriculumProject"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

#pragma mark - UNNotificationCenter delegate methods

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    NSLog(@"userNotificationCenter willPresentNotification");
    
    completionHandler(UNNotificationPresentationOptionAlert|UNNotificationPresentationOptionSound);
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    NSLog(@"userNotificationCenter didReceiveNotificationResponse");
    
    completionHandler();
}


@end
