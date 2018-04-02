//
//  CPView2Controller.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 30..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView2Controller.h"

#import "ViewController.h"

@interface CPView2Controller ()
@property (strong) dispatch_source_t sampleTimer;

@property (strong) dispatch_source_t memorySource1;
@property (strong) dispatch_source_t memorySource2;
@property (strong) dispatch_source_t memorySource3;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic) dispatch_queue_t currentQueue;
@property (nonatomic, weak) NSString *d;
@property (nonatomic) Human *human;
@end

@implementation CPView2Controller

void funcForBlock(void * context) {
    Human *_human = (__bridge_transfer Human *)context;
    NSLog(@"funcForBlock, %@", _human);
};

- (IBAction)buttonHandler:(UIButton *)sender {
    NSLog(@"buttonHandler, %@", sender);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:@"v" forKey:@"k"];
    NSLog(@"value = %@", dic[@"k"]);
    id k2 = nil;
    NSLog(@"key2 = %@, alue2 = %@", k2, dic[k2]);
    
    // Do any additional setup after loading the view.
    
#pragma mark - sample
//    void (^empty)(void) = ^{
//        @autoreleasepool {
//            NSString *hello = @"hello";
//            NSLog(@"hello = %@", hello);
//        }
//    };
//    
//    empty();
//    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//    
////    dispatch_set_finalizer_f(queue, <#dispatch_function_t  _Nullable finalizer#>)
//    
//    dispatch_main();
//    
//    dispatch_group_t group = dispatch_group_create();
//    
//    dispatch_queue_t queue1 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t queue2 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT_INACTIVE);
//    dispatch_queue_t queue3 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT_WITH_AUTORELEASE_POOL);
////    dispatch_queue_t queue4 = dispatch_queue_create_with_target(<#const char * _Nullable label#>, <#dispatch_queue_attr_t  _Nullable attr#>, <#dispatch_queue_t  _Nullable target#>)
//    
//    dispatch_group_async(group, queue, ^{
//        
//    });
//    dispatch_group_enter(group);
//    dispatch_group_leave(group);
//    
//    //dispatch_set_target_queue(<#dispatch_object_t  _Nonnull object#>, <#dispatch_queue_t  _Nullable queue#>)
////    dispatch_queue_attr_make_initially_inactive(<#dispatch_queue_attr_t  _Nullable attr#>)
//    
////    dispatch_release(group);

    
//    NSLog(@"newThread");
//    NSThread *newThread = [[NSThread alloc] initWithBlock:^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"[%zd] 진행", i);
//            [NSThread sleepForTimeInterval:0.5];
//        }
//    }];
//
    
#pragma mark - Dispatch Source
    
#pragma mark examples
//    getppid()
    
//    dispatch_queue_t myQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
    
//    uintptr_t myDescriptor = 0;
//    dispatch_async(myQueue, ^{
//        [NSThread sleepForTimeInterval:3];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.label.text = @"kkkkkkkkkkkkkitten";
//        });
//    });
    
//    dispatch_source_t source1 = dispatch_source_create(DISPATCH_SOURCE_TYPE_D, myDescriptor, 0, myQueue);
//
//    dispatch_source_set_event_handler(source1, ^{
//        NSLog(@"In dispatch_source_set_event_handler");
//        // Get some data from the source variable,
//        // which is captured from the parent context.
//        size_t estimated = dispatch_source_get_data(source1);
////        NSLog(@"size_t = %lu", estimated);
//        // Continue reading the descriptor...
//    });
//    dispatch_resume(source1);
//    dispatch_async(myQueue, ^{
//        [NSThread sleepForTimeInterval:0.1];
//        dispatch_suspend(source1);
//    });
    
//    dispatch_source_get_
//    dispatch_async(myQueue, ^{
//        while (YES) {
//            NSLog(@"while도 빨라!!!");
//        }
//    });
    
//    #define DISPATCH_MEMORYPRESSURE_NORMAL		0x01
//    #define DISPATCH_MEMORYPRESSURE_WARN		0x02
//    #define DISPATCH_MEMORYPRESSURE_CRITICAL	0x04
//    typedef unsigned long dispatch_source_memorypressure_flags_t;
#pragma mark timer
    
//    dispatch_source_t timer
//    = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, myQueue);
//    self.sampleTimer = timer;
//    
//    dispatch_time_t startTime =
////    dispatch_walltime(NULL, 0);
//    dispatch_time(DISPATCH_TIME_NOW, 1ull * NSEC_PER_SEC);
//    
//    dispatch_source_set_timer(timer, startTime, 3ull * NSEC_PER_SEC, 1ull * NSEC_PER_MSEC);
//    
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"wakeup!");
//    });
//    dispatch_source_set_cancel_handler(timer, ^{
//        NSLog(@"timer canceled");
//    });
//    NSLog(@"resume timer");
//    dispatch_resume(timer);
    
#pragma mark MemoryPressure
    
//    dispatch_source_t source2 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_MEMORYPRESSURE, 0, DISPATCH_MEMORYPRESSURE_NORMAL, myQueue);
//    self.memorySource1 = source2;
//    dispatch_source_set_event_handler(source2, ^{
//        NSLog(@"source2 DISPATCH_MEMORYPRESSURE_NORMAL!!");
//    });
//    dispatch_resume(source2);
//    
//    dispatch_source_t source2_2 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_MEMORYPRESSURE, 0, DISPATCH_MEMORYPRESSURE_WARN, myQueue);
//    self.memorySource2 = source2_2;
//    dispatch_source_set_event_handler(source2_2, ^{
//        NSLog(@"source2_2 DISPATCH_MEMORYPRESSURE_WARN!!");
//    });
//    dispatch_resume(source2_2);
//
//    dispatch_source_t source2_3 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_MEMORYPRESSURE, 0, DISPATCH_MEMORYPRESSURE_CRITICAL, myQueue);
//    self.memorySource3 = source2_3;
//    dispatch_source_set_event_handler(source2_3, ^{
//        NSLog(@"source2_3 DISPATCH_MEMORYPRESSURE_CRITICAL!!");
//    });
//    dispatch_resume(source2_3);
    
    
#pragma mark machport
//    NSMachPort *port = [[NSMachPort alloc] init];
//    mach_port_t mach = 0;
//    dispatch_source_t source3 = dispatch_source_create(DISPATCH_SOURCE_TYPE_MACH_SEND, mach, DISPATCH_MACH_SEND_DEAD, myQueue);
//    dispatch_source_set_event_handler(source3, ^{
//        NSLog(@"DISPATCH_SOURCE_TYPE_MACH_SEND!!");
//        
//        mach_port_t machData = (mach_port_t)dispatch_source_get_handle(source3);
//        NSLog(@"mach data = %iu", machData);
//    });
//    dispatch_activate(source3);
    
#pragma mark process call
//    
//    pid_t parentPID = getppid();
//    dispatch_source_t source5 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_PROC, parentPID, DISPATCH_PROC_EXIT, myQueue);
//    
//    dispatch_source_set_event_handler(source5, ^{
//        NSLog(@"DISPATCH_SOURCE_TYPE_PROC_SIGNAL!!");
//        unsigned long data = dispatch_source_get_handle(source5);
//        NSLog(@"data = %zd", data);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            //Do Somethings
//        });
//    });
//    dispatch_activate(source5);
    
////    kill( getpid(), SIGABRT );
    
#pragma mark data add
    
//    __block int total = 0;
//    dispatch_source_t source6 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
////    dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, myQueue);
//    dispatch_source_set_event_handler(source6, ^{
//        unsigned long data = dispatch_source_get_data(source6);
//        total += (int)data;
//        NSLog(@"SOURCE_DATA_ADD = %lu, total = %zd", data, total);
//    });
//    dispatch_resume(source6);
//    
//    __block int sum = 0;
//    for (int i = 0; i < 10; i++) {
//        int data = arc4random()%10;
//        NSTimeInterval sleepTime = (data%10)/10.0;
//        NSLog(@"[%zd]data = %zd, sleepTime = %f", i, data, sleepTime);
//        sum += data;
//        
//        dispatch_async(myQueue, ^{
//            [NSThread sleepForTimeInterval:sleepTime];
//            NSLog(@"##[%zd]merge, data = %zd", i, data);
//            dispatch_source_merge_data(source6, data);
//        });
//    }
//    NSLog(@"************* sum = %zd", sum);
//    NSLog(@" ");
    
//    kill( getpid(), SIGABRT );

#pragma mark SIGNAL call1
    
//    __weak typeof(self) weakSelf = self;
//    
//    dispatch_source_t source4 =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_SIGNAL, SIGSTOP, 0, myQueue);
//    dispatch_source_set_event_handler(source4, ^{
//        NSLog(@"DISPATCH_SOURCE_TYPE_SIGNAL_SIGSTOP!!");
//        NSLog(@"label's value = %@", weakSelf.label.text);
//        
//        unsigned long data = dispatch_source_get_handle(source4);
//        NSLog(@"data = %zd", data);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            //Do Somethings
//            NSLog(@"label's value = %@", weakSelf.label.text);
//        });
//    });
//    dispatch_activate(source4);
    
    
#pragma mark Descriptor _ file read case
    
//    printf("##### file read descriptor source #####");
//    NSString *filePathIn =
//    [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"ReadMe.txt"];
//    const char *filePath = filePathIn.cString;
//    
//    int infd = open(filePath, O_RDONLY);
//    if (infd == -1) NSLog(@"error");
//    if (fcntl(infd, F_SETFL, O_NONBLOCK) != 0) NSLog(@"error");
//    
//    dispatch_queue_t serialQ = dispatch_queue_create("com.fileRead.curriculum.com",NULL);
//    dispatch_source_t fileSource =
//    dispatch_source_create(DISPATCH_SOURCE_TYPE_READ, infd, 0, serialQ);
//    
//    dispatch_source_set_event_handler( fileSource, ^{
//        char buffer[100];
//        size_t estimated = dispatch_source_get_data(fileSource);
//        printf("Estimated bytes available: %ld\n", estimated);
//        ssize_t actual = read(infd, buffer, sizeof(buffer));
//        if (actual == -1) {
//            if (errno != EAGAIN) {
//                perror("read"); exit(-1);
//            }
//        } else {
//            if  (estimated>actual) {
//                printf("  bytes read: %ld\n", actual);
//            } else {
//                // end of file has been reached.
//                printf("  last bytes read: %ld\n", actual);
//                dispatch_source_cancel(fileSource);
//            }
//            printf("%s\n", buffer);
//        }
//    });
//    
//    dispatch_source_set_cancel_handler( fileSource, ^{
//        close(infd);
//    });
//    printf("dispatch_resume(fileSource)\n");
//    dispatch_resume(fileSource);

    
    
    
    
    
    
    
    
    

#pragma mark - Concurrent Queue
    
#pragma mark deadlock Test2
    //    dispatch_queue_t serial = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
    //    dispatch_queue_t serial2 = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
    //
    //    dispatch_sync(serial2, ^{
    //        [NSThread sleepForTimeInterval:1];
    //        NSLog(@"aa 1");
    //        dispatch_sync(serial, ^{
    //            [NSThread sleepForTimeInterval:1];
    //            NSLog(@"aa 2");
    //            dispatch_sync(serial2, ^{ // deadlock, therefore crash occur
    //                [NSThread sleepForTimeInterval:1];
    //                NSLog(@"aa 3");
    //            });
    //        });
    //    });
    //    dispatch_sync(serial, ^{
    //        [NSThread sleepForTimeInterval:1];
    //        NSLog(@"bb");
    //        dispatch_sync(serial2, ^{
    //            [NSThread sleepForTimeInterval:1];
    //            NSLog(@"bb");
    //        });
    //    });
#pragma mark deadlock Test
    //// Concurrent Queue
//    dispatch_queue_t global_c_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t global_c_queue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//    dispatch_queue_t serial = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t serial2 = dispatch_queue_create("", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_sync(serial2, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"aa 1");
//        dispatch_sync(serial, ^{
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"aa 2");
//            dispatch_sync(serial2, ^{ // deadlock, therefore crash occur
//                [NSThread sleepForTimeInterval:1];
//                NSLog(@"aa 3");
//            });
//        });
//    });
//    dispatch_sync(serial, ^{
//        [NSThread sleepForTimeInterval:1];
//        NSLog(@"bb");
//        dispatch_sync(serial2, ^{
//            [NSThread sleepForTimeInterval:1];
//            NSLog(@"bb");
//        });
//    });
    
//    dispatch_set_finalizer_f(<#dispatch_object_t  _Nonnull object#>, <#dispatch_function_t  _Nullable finalizer#>)
//    NSLog(@"1gogo, %@", [NSThread currentThread]);
//    dispatch_sync(serial , ^{
//        NSLog(@"2gogo, %@", [NSThread currentThread]);
//        
//        dispatch_sync(serial, ^{
//            NSLog(@"3gogo, %@", [NSThread currentThread]);
//        });
//    });
//    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_sync(concurrentQueue, ^{
//        NSLog(@"1gogo, %@", [NSThread currentThread]);
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"2gogo, %@", [NSThread currentThread]);
//        });
//        NSLog(@"3gogo, %@", [NSThread currentThread]);
//        
//        dispatch_queue_t mainQ = dispatch_get_main_queue();
//        NSLog(@"3_1gogo, %@", [NSThread currentThread]);
//        
//        dispatch_sync(mainQ, ^{
//            NSLog(@"4gogo, %@", [NSThread currentThread]);
//        });
//        NSLog(@"5gogo, %@", [NSThread currentThread]);
//    });

    
#pragma mark Group3
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_group_t group = dispatch_group_create();
//    
//    self.human = [[Human alloc] initWithName:@"영희" age:13];
//    NSLog(@"######## start");
//    
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"--- start async");
//        dispatch_group_async(group, concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:0.5];
//            [self.human eat]; // age++;
//            NSLog(@"#[1] human = %@", self.human);
//        });
//        dispatch_group_async(group, concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:1.0];
//            [self.human eat]; [self.human setName:@"철수"];
//            NSLog(@"#[2] human = %@", self.human);
//        });
//        
////        dispatch_group_enter(group);
//        dispatch_sync(concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:3.0];
//            NSLog(@"#[3] human = %@", self.human);
////            dispatch_group_leave(group);
//        });
//        NSLog(@"--- end async"); 
//    });
//    dispatch_group_notify(group, concurrentQueue, ^{
//        NSLog(@"#[end] dispatch_group_notify");
//    });
//    NSLog(@"######## end");

    
#pragma mark Group2
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
//    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_group_t group = dispatch_group_create();
//    
//    self.human = [[Human alloc] initWithName:@"영희" age:13];
//    NSLog(@"######## start");
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#### start async");
////        dispatch_group_enter(group);
////        dispatch_sync(concurrentQueue, ^{
//////            [NSThread sleepForTimeInterval:0.5];
////            [self.human eat];
////            NSLog(@"#[1] human = %@", self.human);
////            dispatch_group_leave(group);
////        });
//        dispatch_group_enter(group);
////        dispatch_sync(concurrentQueue, ^{
//////            [NSThread sleepForTimeInterval:1.0];
////            [self.human eat]; [self.human setName:@"철수"];
////            NSLog(@"#[2] human = %@", self.human);
////            dispatch_group_leave(group);
////        });
//        dispatch_group_notify(group, concurrentQueue, ^{
//            NSLog(@"#### dispatch_group_notify");
//        });
//        
//        dispatch_group_async(group, concurrentQueue, ^{
//            NSLog(@"#[2_2] human = %@", self.human);
//            dispatch_group_leave(group);
//            NSLog(@"#[2_3] human = %@", self.human);
//        });
//        
////        dispatch_group_enter(group);
////        dispatch_sync(concurrentQueue, ^{
//////            [NSThread sleepForTimeInterval:1.5];
////            [self.human eat];
////            NSLog(@"#[3] human = %@", self.human);
////            dispatch_group_leave(group);
////            if (YES) {
////                dispatch_group_leave(group);
////            }else {
////                dispatch_group_leave(group);
////            }
//////            dispatch_group_leave(group);
////        });
//        
////        dispatch_group_wait(group, popTime);
//        NSLog(@"#### end async");
////        dispatch_block_cancel(<#^(void)block#>)
////
////        dispatch_group_enter(group);
////        dispatch_async(concurrentQueue, ^{
////            //            [NSThread sleepForTimeInterval:1.5];
////            NSLog(@"#[4] human = %@", self.human);
////            dispatch_group_leave(group);
////        });
//    });
//    NSLog(@"######## end");
    
    
//    self.label.text = @"asdf";
//    dispatch_barrier_async(concurrentQueue, ^{
//        NSLog(@"label.text = %@", self.label.text);
//    });
    
#pragma mark Group1
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_group_t group = dispatch_group_create();
//    
//    self.human = [[Human alloc] initWithName:@"영희" age:13];
//    NSLog(@"######## start");
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#### start async");
//        dispatch_group_async(group, concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:0.5];
//            [self.human eat];
//            NSLog(@"#[1] human = %@", self.human);
//        });
//        dispatch_group_async(group, concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:1];
//            [self.human eat];
//            NSLog(@"#[2] human = %@", self.human);
//        });
//        dispatch_group_async(group, concurrentQueue, ^{
//            [NSThread sleepForTimeInterval:1.5];
//            [self.human eat];
//            NSLog(@"#[3] human = %@", self.human);
//        });
//        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
//        NSLog(@"#### end async");
//    });
//    NSLog(@"######## end");
#pragma mark Semaphore
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(3);
//    
//    self.human = [[Human alloc] initWithName:@"데이빗" age:80];
//    
//    for (int i = 0; i < 9; i++) {
//        dispatch_async(concurrentQueue, ^{
//            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//            NSLog(@"#[%zd] human = %@", i, self.human);
//            [NSThread sleepForTimeInterval:1];
//            dispatch_semaphore_signal(semaphore);
//        });
//    }
#pragma mark Barrier
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    self.human = [[Human alloc] initWithName:@"영희" age:0];
//    for (int i = 0; i < 10; i++) {
//        dispatch_async(concurrentQueue, ^{
//            [self.human eat];
//            NSLog(@"#[%zd] human = %@", i, self.human);
//        });
//    }
//    dispatch_barrier_async(concurrentQueue, ^{
//        NSLog(@"### barrier human = %@", self.human);
//        [NSThread sleepForTimeInterval:1];
//    });
//    for (int i = 10; i < 20; i++) {
//        dispatch_async(concurrentQueue, ^{
//            [self.human eat];
//            NSLog(@"#[%zd] human = %@", i, self.human);
//        });
//    }
#pragma mark Autorelease Pool
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(concurrentQueue, ^{
//        @autoreleasepool {
//            NSObject *newObject = [NSObject new];
//            
//            NSMutableArray *m_array = [NSMutableArray array];
//            
//            for (int i = 0; i < 10000; i++) {
//                [m_array addObject:@(i)];
//            }
//            
//            [m_array addObject:newObject];
//        }
//    });

#pragma mark apply 1
    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    //    self.currentQueue = concurrentQueue;
//    
//    NSLog(@"start~");
//    int total = 5;
//    for (int i = 0; i < total; i++) {
//        dispatch_async(concurrentQueue, ^{
//            // Do Something
//            NSLog(@"#%zd for", i);
//        });
//    }
//    NSLog(@"mid~");
//    //    dispatch_apply(total, concurrentQueue, ^(size_t i) {
//    //        // Do Something
//    //        NSLog(@"#%zd apply", i);
//    //    });
//    NSLog(@"end~");

    
#pragma mark apply 2

//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("com.curriculum.concurrent", DISPATCH_QUEUE_CONCURRENT);
//    
//    NSLog(@"start~");
//    int total = 10000;
//    int stride = 100;
//    dispatch_apply(total/stride, concurrentQueue, ^(size_t i) {
//        // Do Something
//        int idx = (int)(stride*i);
//        NSLog(@"[%zd]", idx);
//        for (int j = idx; j < (idx+stride); j++) {
//            NSLog(@"\t%zd", j);
//        }
//    });
//    NSLog(@"end~");
    
#pragma mark set_context
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    //    self.currentQueue = concurrentQueue;
//    
//    Human *h = [[Human alloc] initWithName:@"영희" age:13];
//    
//    dispatch_set_context(concurrentQueue, (__bridge_retained void *)h);
//    dispatch_set_finalizer_f(concurrentQueue, &funcForBlock);
//    
//    for (int i = 0; i < 5; i++) {
//        dispatch_async(concurrentQueue, ^{
//            Human *h1 = (__bridge Human *)dispatch_get_context(concurrentQueue);
//            NSLog(@"#%zd async! h1 = %@", i, h1);
//        });
//    }
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    __weak NSString *descriptor = @"descriptor";
//    self.d = descriptor;
//    
//    Human *h = [[Human alloc] initWithName:@"영희" age:13];
//    self.human = h;
//    NSLog(@"human = %@", self.human);
//    
//    dispatch_set_context(concurrentQueue, (__bridge void *)self.human);
//    dispatch_set_finalizer_f(concurrentQueue, &funcForBlock);
//    
//    for (int i = 0; i < 5; i++) {
//        dispatch_async(concurrentQueue, ^{
//            NSLog(@"#%zd async!", i);
//        });
//    }
    
#pragma mark 우선순위!! 실패..
//    dispatch_queue_t global_c_queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t global_c_queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
//    
//    dispatch_block_t block = ^{
//        NSMutableArray *array = [NSMutableArray array];
//        int sum = 0;
//        for (int i = 0; i < 10000; i++) {
//            sum += i;
//            [array addObject:[NSObject new]];
//        }
//    };
//    
//    dispatch_async(global_c_queue1, ^{
//        for (int i = 0; i < 100; i++) {
////            [NSThread sleepForTimeInterval:0.01];
//            dispatch_async(global_c_queue1, block);
//            if (i == 99) {
//                dispatch_barrier_async(global_c_queue1, ^{
//                    NSLog(@"#1 finished");
//                });
//            };
//        }
//    });
//    
//    dispatch_async(global_c_queue2, ^{
//        for (int i = 0; i < 100; i++) {
////            NSLog(@"#2");
////            [NSThread sleepForTimeInterval:0.01];
//            dispatch_async(global_c_queue2, block);
//            if (i == 99) {
//                dispatch_barrier_async(global_c_queue2, ^{
//                    NSLog(@"#2 finished");
//                });
//            };
//        }
//    });
//    dispatch_queue_t concurrentQueue1 =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t concurrentQueue2 =
//    dispatch_queue_create("Concurrent_2", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_set_target_queue(concurrentQueue1, global_c_queue1);
//    dispatch_set_target_queue(concurrentQueue2, global_c_queue2);
//    dispatch_async(concurrentQueue1, ^{
//        block();
//        NSLog(@"#1_1 finished");
//    });
//    dispatch_async(concurrentQueue1, ^{
//        block();
//        NSLog(@"#1_2 finished");
//    });
//    dispatch_async(concurrentQueue2, ^{
//        block();
//        NSLog(@"#2_1 finished");
//    });
//    dispatch_async(concurrentQueue2, ^{
//        block();
//        NSLog(@"#2_2 finished");
//    });
    
#pragma mark 동기 실행 주의사항
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    NSLog(@"start! %@", [NSThread currentThread]);
//    dispatch_sync(concurrentQueue, ^{
//        NSLog(@"#1 sync!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#2 async!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#3_1 async!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"###3_2 sync again!!, %@", [NSThread currentThread]);
//            NSLog(@"###3_2 sync again!!");
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###3_3 sync again!!, %@", [NSThread currentThread]);
//            NSLog(@"###3_3 sync again!!");
//        });
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"###3_4 sync again!!, %@", [NSThread currentThread]);
//            NSLog(@"###3_4 sync again!!");
//        });
//        
//        NSLog(@"#3_1 async!!");
//        NSLog(@"concurrentQueue = %@", concurrentQueue);
//        NSLog(@"currentQueue = %@", dispatch_get_current_queue());
//        // deadlock // but, this function are deprecated
//        dispatch_sync(dispatch_get_current_queue(), ^{
//            NSLog(@"deadLock");
//        });
//        NSLog(@"deadLock finished");
//    });
    // deadlock
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"deadLock");
//    });
    
#pragma mark 비동기/동기 비교
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    
//    NSLog(@"start! %@", [NSThread currentThread]);
//    dispatch_block_t block = ^{
//        NSLog(@"#0 declared block!!, %@", [NSThread currentThread]);
//    };
//    dispatch_async(concurrentQueue, block);
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#1 inline block!!, %@", [NSThread currentThread]);
//    });
//    dispatch_sync(concurrentQueue, ^{
//        NSLog(@"sync!!, %@", [NSThread currentThread]);
//    });
//    NSLog(@"#### end sync");
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#2 inline block!!, %@", [NSThread currentThread]);
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"#2 inline block!!");
//        }
//    });
#pragma mark Suspend
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    self.currentQueue = concurrentQueue;
//    dispatch_suspend(concurrentQueue);
//    NSLog(@"start! %@", [NSThread currentThread]);
//    
//    dispatch_block_t block = ^{
//        NSLog(@"#0 declared block!!, %@", [NSThread currentThread]);
//    };
//    dispatch_async(concurrentQueue, block);
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#1 inline block!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#2 inline block!!, %@", [NSThread currentThread]);
//        for (int i = 0; i < 3; i++) {
//            NSLog(@"#2 inline block!!");
//        }
//    });
//    NSLog(@"#### end!");
    
#pragma mark - Serial Queue
    
    
#pragma mark 작업의 동기화 시점 & 경합 상태 예방
//    self.human = [[Human alloc] initWithName:@"영희" age:13];
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"start = %@", self.human);
//    dispatch_async(serialQueue, ^{
//        [self.human changeName:@"철수"];
//        NSLog(@"#1 human = %@", self.human);
//    });
//    dispatch_sync(serialQueue, ^{
//        [self.human changeName:@"다시 영희"];
//        NSLog(@"#2 human = %@", self.human);
//    });
//    dispatch_async(serialQueue, ^{
//        [self.human changeName:@"또다시 철수"];
//        NSLog(@"#3 human = %@", self.human);
//    });
//    NSLog(@"end");
#pragma mark 동기 실행 주의사항2
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    NSLog(@"start! %@", [NSThread currentThread]);
//    dispatch_async(serialQueue, ^{ // or Sync
//        NSLog(@"#1 async to Serial!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"###1_1 sync to GlobalQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###1_2 sync to MainQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(serialQueue, ^{
//            NSLog(@"###1_3 sync to CurrentQueue!!");
//        });
//        NSLog(@"#3_1 async!!");
//    });
//    NSLog(@"end! %@", [NSThread currentThread]);
    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#2 async to concurrent!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"###2_1 sync to GlobalQueue!!, %@", [NSThread currentThread]);
//        });
//        for (int i = 0; i < 100000; i++) {
//            dispatch_async(concurrentQueue, ^{
//                NSNumber *n = [NSNumber numberWithFloat:@"5".floatValue];
//            });
//        }
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###2_2 sync to MainQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"###2_3 sync to CurrentQueue!!, %@", [NSThread currentThread]);
//        });
//    });
//    NSLog(@"end! %@", [NSThread currentThread]);
    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_sync(concurrentQueue, ^{
//        NSLog(@"#3 sync to concurrent!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"###3_1 sync to GlobalQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"###3_2 sync to CurrentQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(serialQueue, ^{
//            NSLog(@"###3_3 sync to CurrentQueue!!, %@", [NSThread currentThread]);
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###3_3 sync to MainQueue!!, %@", [NSThread currentThread]);
//        });
//        
//    });
//    NSLog(@"end! %@", [NSThread currentThread]);
    
//    dispatch_queue_t concurrentQueue =
//    dispatch_queue_create("Concurrent_1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_async(concurrentQueue, ^{
//        NSLog(@"#4 start async to concurrent!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###4_1 start sync to MainQueue!!, %@", [NSThread currentThread]);
//            NSMutableArray *array = [NSMutableArray array];
//            for (int i = 0; i < 100000; i++) {
//                NSNumber *n = [NSNumber numberWithFloat:@"5".floatValue];
//                [array addObject:n];
//            }
//            NSLog(@"###4_1 end sync to MainQueue!!, %@", [NSThread currentThread]);
//        });
//        
//        dispatch_sync(concurrentQueue, ^{
//            NSLog(@"###4_2 start sync to CurrentQueue!!, %@", [NSThread currentThread]);
//            NSMutableArray *array = [NSMutableArray array];
//            for (int i = 0; i < 100000; i++) {
//                NSNumber *n = [NSNumber numberWithFloat:@"5".floatValue];
//                [array addObject:n];
//            }
//            NSLog(@"###4_2 end sync to CurrentQueue!!, %@", [NSThread currentThread]);
//        });
//        NSLog(@"#4 end async to concurrent!!, %@", [NSThread currentThread]);
//    });
//    for (int i = 0; i < 100; i++) {
//        dispatch_async(concurrentQueue, ^{
//            NSLog(@"#4_3 [%zd] async to concurrent!!, %@",
//                  i, [NSThread currentThread]);
//        });
//    }
//    
//    for (int i = 0; i < 100; i++) {
//        NSLog(@"#main for [%zd]", i);
//    }
//    
//    NSLog(@"end! %@", [NSThread currentThread]);
#pragma mark 동기 실행 주의사항
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    
//    NSLog(@"start! %@", [NSThread currentThread]);
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"#1 sync!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        NSLog(@"#2 async!!, %@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        NSLog(@"#3_1 async!!, %@", [NSThread currentThread]);
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"###3_2 sync again!!, %@", [NSThread currentThread]);
//            NSLog(@"###3_2 sync again!!");
//        });
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"###3_3 sync again!!, %@", [NSThread currentThread]);
//            NSLog(@"###3_3 sync again!!");
//        });
//        dispatch_sync(serialQueue, ^{
//            NSLog(@"###3_4 sync again!!");
//        });
//        NSLog(@"#3_1 async!!");
//        
//        // deadlock // but, this function are deprecated
////        dispatch_sync(dispatch_get_current_queue(), ^{
////            NSLog(@"deadLock");
////        });
//    });
    // deadlock
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"deadLock");
//    });

    //// Serial Queue
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    dispatch_block_t block = ^{
//        NSLog(@"#0 declared block!!");
//    };
//    dispatch_async(serialQueue, block);
//    dispatch_async(serialQueue, ^{
//        NSLog(@"#1 inline block!!");
//    });
//    dispatch_function_t func = &funcForBlock;
//    dispatch_async_f(serialQueue, nil, func);
    
    
//    dispatch_suspend(serialQueue);
    
//    dispatch_queue_t serialQueue =
//    dispatch_queue_create("Serial_1", DISPATCH_QUEUE_SERIAL);
//    self.currentQueue = serialQueue;
//    NSLog(@"start! %@", [NSThread currentThread]);
//    
//    dispatch_block_t block = ^{
//        NSLog(@"#0 declared block!!");
//        NSLog(@"%@", [NSThread currentThread]);
//    };
//    dispatch_async(serialQueue, block);
//    dispatch_async(serialQueue, ^{
//        NSLog(@"#1 inline block!!");
//    });
//    dispatch_sync(serialQueue, ^{
//        NSLog(@"sync!!");
//        NSLog(@"%@", [NSThread currentThread]);
//    });
//    dispatch_async(serialQueue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"#2 inline block!!");
//        }
//    });
    
    
//    dispatch_async(serialQueue, ^{
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"#3 inline block!!");
//        }
//        
//        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            NSLog(@"sync again!!");
//            NSLog(@"%@", [NSThread currentThread]);
//            for (int i = 0; i < 10; i++) {
//                NSLog(@"#3 Sync!!");
//            }
//        });
//        
//        for (int i = 0; i < 10; i++) {
//            NSLog(@"#3 inline block!!");
//        }
//        
////        dispatch_sync(dispatch_get_current_queue(), ^{
////            NSLog(@"deadLock");
////        });
//    });
//    
//    // deadlock
//    dispatch_sync(dispatch_get_main_queue(), ^{
////        dispatch_get_current_queue()
//        NSLog(@"deadLock");
//    });
    
#pragma mark - GCD 동기 스레드 킬 테스트
    
//    dispatch_queue_t concurrentQueue0 = dispatch_queue_create("concurrent.label.label0", DISPATCH_QUEUE_CONCURRENT);
////    dispatch_queue_t concurrentQueue1 = dispatch_queue_create("concurrent.label.label1", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t seralQueue0 = dispatch_queue_create("serial.label.label0", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t seralQueue1 = dispatch_queue_create("serial.label.label1", DISPATCH_QUEUE_SERIAL);
//    
//    dispatch_async(seralQueue0, ^{
//        NSLog(@"비동기 큐 시작 %@", [NSThread currentThread]);
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"\t#1 비동기 메인큐 시작 %@", [NSThread currentThread]);
//            dispatch_async(seralQueue1, ^{
//                NSLog(@"\t\t 비동기 시리얼큐 시작 %@", [NSThread currentThread]);
//                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    NSLog(@"\t\t\t#2 비동기 메인큐 시작 %@", [NSThread currentThread]);
//                    
//                    dispatch_sync(concurrentQueue0, ^{
//                        NSLog(@"\t\t\t\t 마지막 테스트 하고 싶은 동기 for 병렬큐 %@", [NSThread currentThread]);
//                    });
//                    
//                    NSLog(@"\t\t\t#2 비동기 메인큐 끝 %@", [NSThread currentThread]);
//                });
//                
//                NSLog(@"\t\t 비동기 시리얼큐 끝 %@", [NSThread currentThread]);
//            });
//            
//            NSLog(@"\t#1 비동기 메인큐 끝 %@", [NSThread currentThread]);
//        });
//        
//        //        dispatch_sync(sQueue, ^{
//        //            NSLog(@"동기 시리얼큐");
//        //        });
//        
//        NSLog(@"비동기 큐 끝 %@", [NSThread currentThread]);
//    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"shouldPerformSegueWithIdentifier %@, %@", identifier, sender);
    return YES;
}

//- (IBAction)buttonHandler:(UIButton *)sender {
//    NSLog(@"buttonHandler");
////    dispatch_source_cancel(self.sampleTimer);
//    
////    dispatch_activate(self.sampleTimer);
////    dispatch_cancel(self.sampleTimer);
//}

//- (IBAction)buttonHandler:(UIButton *)sender {
//    NSLog(@"buttonHandler");
////    dispatch_resume(self.currentQueue);
////    NSLog(@"d = %@", self.d);
////    NSLog(@"human = %@", self.human);
//    
////    dispatch_resume(self.currentQueue);
//}

- (void)log {
    NSLog(@"I'm David..");
}

- (IBAction)unwindToCPView2:(UIStoryboardSegue*)unwindSegue {
    
}
@end
