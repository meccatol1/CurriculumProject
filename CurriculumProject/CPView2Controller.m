//
//  CPView2Controller.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 5. 30..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "CPView2Controller.h"

@interface CPView2Controller ()

@end

@implementation CPView2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    void (^empty)(void) = ^{
        @autoreleasepool {
            NSString *hello = @"hello";
            NSLog(@"hello = %@", hello);
        }
    };
    
    empty();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
//    dispatch_set_finalizer_f(queue, <#dispatch_function_t  _Nullable finalizer#>)
    
    dispatch_main();
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue1 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT_INACTIVE);
    dispatch_queue_t queue3 = dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT_WITH_AUTORELEASE_POOL);
//    dispatch_queue_t queue4 = dispatch_queue_create_with_target(<#const char * _Nullable label#>, <#dispatch_queue_attr_t  _Nullable attr#>, <#dispatch_queue_t  _Nullable target#>)
    
    dispatch_group_async(group, queue, ^{
        
    });
    dispatch_group_enter(group);
    dispatch_group_leave(group);
    
    //dispatch_set_target_queue(<#dispatch_object_t  _Nonnull object#>, <#dispatch_queue_t  _Nullable queue#>)
//    dispatch_queue_attr_make_initially_inactive(<#dispatch_queue_attr_t  _Nullable attr#>)
    
//    dispatch_release(group);
    
    
    
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

@end
