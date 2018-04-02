//
//  ScrollViewTestingViewController.m
//  CurriculumProject
//
//  Created by Hyungsung Kim on 2017. 9. 11..
//  Copyright © 2017년 meccatol_iMac. All rights reserved.
//

#import "ScrollViewTestingViewController.h"

@interface ScrollViewTestingViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIScrollView *oneScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *twoScrollView;
@property (weak, nonatomic) IBOutlet UISwitch *scollViewSwitch;
@property (assign, nonatomic) NSInteger totalCount;

@end

@implementation ScrollViewTestingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
//    [panGestureRecognizer setDelaysTouchesBegan:YES];
//    [panGestureRecognizer setDelaysTouchesEnded:YES];
    [self.oneScrollView addGestureRecognizer:panGestureRecognizer];
    
//    [self.oneScrollView.panGestureRecognizer addTarget:self action:@selector(handleGesture:)];
    
    self.totalCount = 80;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    for (int i = 0; i < _totalCount; i++) {
        CGRect newFrame = CGRectMake(CGRectGetWidth(self.containerView.frame)*i, 0, CGRectGetWidth(self.containerView.frame), CGRectGetHeight(self.containerView.frame));
        CGRect labelFrame = CGRectMake(0, 0, CGRectGetWidth(self.containerView.frame), CGRectGetHeight(self.containerView.frame));
        UIView *view1 = [[UIView alloc] initWithFrame:newFrame];
        view1.backgroundColor =
        ( i%2 == 0 ? [UIColor redColor] : [UIColor blueColor] );
        UIView *view2 = [[UIView alloc] initWithFrame:newFrame];
        view2.backgroundColor =
        ( i%2 == 0 ? [UIColor purpleColor] : [UIColor greenColor] );
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:labelFrame];
        [label1 setText:@"1"];
        [label1 setFont:[UIFont systemFontOfSize:20]];
        [label1 setTextColor:[UIColor blackColor]];
        [label1 setTextAlignment:NSTextAlignmentCenter];
        [view1 addSubview:label1];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:labelFrame];
        [label2 setText:@"2"];
        [label2 setFont:[UIFont systemFontOfSize:20]];
        [label2 setTextColor:[UIColor blackColor]];
        [label2 setTextAlignment:NSTextAlignmentCenter];
        [view2 addSubview:label2];
        
        [self.oneScrollView addSubview:view1];
        [self.twoScrollView addSubview:view2];
    }
    
    [self.oneScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.containerView.frame)*_totalCount, CGRectGetHeight(self.containerView.frame))];
    [self.twoScrollView setContentSize:CGSizeMake(CGRectGetWidth(self.containerView.frame)*_totalCount, CGRectGetHeight(self.containerView.frame))];
    
    maxOffset = CGRectGetWidth(self.containerView.frame)*(_totalCount-1);
}

- (IBAction)switchHandler:(UISwitch *)sender {
    if (sender.isOn) {
        [self.containerView bringSubviewToFront:self.twoScrollView];
    } else {
        [self.containerView bringSubviewToFront:self.oneScrollView];
    }
}

static CGFloat maxOffset;
static CGFloat progress = 0.0f;

- (void)handleGesture:(UIPanGestureRecognizer *)pan {
    NSLog(@"handle = %@", pan);
    
    static CGPoint startOffset;
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            startOffset = self.oneScrollView.contentOffset;
            break;
        case UIGestureRecognizerStateChanged:{
            CGPoint newPoint = [pan translationInView:self.oneScrollView];
            [UIView animateWithDuration:0.03 delay:0.0 options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 [self.oneScrollView setContentOffset:CGPointMake(MIN(maxOffset, MAX(0, startOffset.x-newPoint.x)) , 0)];
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
            break;
        case UIGestureRecognizerStateEnded:{
            CGPoint newPoint = [pan translationInView:self.oneScrollView];
            progress = (CGFloat)(MIN(maxOffset, MAX(0, startOffset.x-newPoint.x))/CGRectGetWidth(self.containerView.frame));
            NSLog(@"progress = %f", progress);
            
            NSInteger toIdx = (NSInteger)( [pan velocityInView:self.oneScrollView].x <= 0 ? ceil(progress) : floor(progress) );
            
//            [self.oneScrollView setContentOffset:CGPointMake(CGRectGetWidth(self.containerView.frame)*toIdx , 0) animated:YES];
            [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [self.oneScrollView setContentOffset:CGPointMake(CGRectGetWidth(self.containerView.frame)*toIdx , 0)];
                             } completion:^(BOOL finished) {
                                 
                             }];
        }
            break;
        default:
            break;
    }
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
