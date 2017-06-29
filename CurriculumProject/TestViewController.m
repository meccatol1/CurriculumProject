//
//  TestViewController.m
//  CurriculumProject
//
//  Created by meccatol_iMac on 2017. 6. 28..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

//- (void)loadView {
////    [super loadView];
//    NSLog(@"loadView, [self isViewLoaded] -> %@",
//              ([self isViewLoaded]?@"YES":@"NO"));
//    
//    UIView *selfView =
//    [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
//    selfView.backgroundColor = [UIColor whiteColor];
//    /* or
//     UIView *selfView =
//    [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
//     */
//    
//    [self setView:selfView];
//}

+ (BOOL)instancesRespondToSelector:(SEL)aSelector {
    NSLog(@"instancesRespondToSelector = %@", NSStringFromSelector(aSelector));
    return [super instancesRespondToSelector:aSelector];
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod = %@", NSStringFromSelector(sel));
//    //    if (sel == @selector(resolveThisMethodDynamically)) {
//    //        return class_addMethod([self class], sel, (IMP)function, "v@:");
//    //    }
//    return [super resolveInstanceMethod:sel];
//}

- (void)setView:(UIView *)view {
    [super setView:view];
    NSLog(@"setView = %@", view);
}

- (id)init {
    self = [super init];
    if (self) {
        // _view 불가능
        NSLog(@"init, [self isViewLoaded] -> %@",
              ([self isViewLoaded]?@"YES":@"NO"));
        NSLog(@"self.view = %@", self.view);
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSLog(@"initWithCoder, [self isViewLoaded] -> %@",
              ([self isViewLoaded]?@"YES":@"NO"));
        NSLog(@"self.view = %@", self.view);
    }
    return self;
}

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        NSLog(@"initWithNibName [%@], [self isViewLoaded] -> %@",
//              nibNameOrNil, ([self isViewLoaded]?@"YES":@"NO"));
//        NSLog(@"self.view = %@", self.view);
//    }
//    return self;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonHandler:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
